#!/usr/bin/env bash

# Messaging API functions

declare output token uri
basepath=messagingrest/v1

# Payload builders ----------------------------------------------------------

build_payload_webhook_subscription() {
  local name=$1
  local queue=$2
  local endpoint=$3
  yq eval -o json - << EO_WEBHOOK_SUBSCRIPTION
name: "$name"
address: "queue:$queue"
qos: ${qos:-0}
pushConfig:
  type: webhook
  endpoint: "$endpoint"
  exemptHandshake: true
EO_WEBHOOK_SUBSCRIPTION
}

build_payload_webhook_subscription_state() {
  local state=$1
  yq eval -o json - << EO_WEBHOOK_SUBSCRIPTION_STATE
action: "$state"
EO_WEBHOOK_SUBSCRIPTION_STATE
}

# Main functions ------------------------------------------------------------

list_webhook_subscriptions() {
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request GET \
    "$uri/$basepath/subscriptions" | jq .
}

get_webhook_subscription() {
  local name=$1
  if [[ -z "$name" ]]; then
    err Usage: get_webhook_subscription name
    exit 1
  fi
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request GET \
    "$uri/$basepath/subscriptions/$name"
}

create_webhook_subscription() {
  local name=$1
  local queue=$2
  local endpoint=$3
  if [[ -z "$name" ]] || [[ -z "$queue" ]] || [[ -z "$endpoint" ]]; then
    err Usage: create_webhook_subscription name queue endpoint
    exit 1
  fi
  local payload
  if [[ -z "$name" ]] || [[ -z "$queue" ]] || [[ -z "$endpoint" ]]; then
    err Usage: create_webhook_subscription name queue endpoint
    exit 1
  fi
  payload=$(build_payload_webhook_subscription "$name" "$queue" "$endpoint")
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --header 'Content-Type: application/json' \
    --request POST \
    --data "$payload" \
    "$uri/$basepath/subscriptions" \
    | jq .
}

delete_webhook_subscription() {
  local name=$1
  if [[ -z "$name" ]]; then
    err Usage: delete_webhook_subscription name
    exit 1
  fi
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request DELETE \
    "$uri/$basepath/subscriptions/$name" \
    | jq .
}

_publish_message() {
  local targettype=$1
  local target=$2
  local message=$3
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --header "x-qos: $qos" \
    --header 'Content-Type: application/json' \
    --request POST \
    --data '{"message":"'"$message"'"}' \
    "$uri/$basepath/$targettype/$target/messages"
}

publish_message_to_queue() {
  local queue=$1
  local message=$2
  if [[ -z "$queue" ]] || [[ -z "$message" ]]; then
    err Usage: publish_message_to_queue name message
    exit 1
  fi
  log "Publish message to queue $queue"
  _publish_message queues "$queue" "$message"
}

publish_message_to_topic() {
  local topic=$1
  local message=$2
  if [[ -z "$topic" ]] || [[ -z "$message" ]]; then
    err Usage: publish_message_to_topic name message
    exit 1
  fi
  log "Publish message to topic $topic"
  topic="$(echo -n "$topic" | url-encode)"
  _publish_message topics "$topic" "$message"
}

trigger_handshake_request() {
  local name=$1
  if [[ -z "$name" ]]; then
    err Usage: trigger_handshake_request name
    exit 1
  fi
  log "Trigger handshake request for webhook subscription $name"
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request POST \
    "$uri/$basepath/subscriptions/$name/handshake"
}

_set_subscription_state() {
  local name=$1
  local state=$2
  if [[ -z "$name" ]] || [[ -z "$state" ]]; then
    err Usage: _set_subscription_state name state
    exit 1
  fi
  payload=$(build_payload_webhook_subscription_state "$state")
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request PUT \
    --data "$payload" \
    "$uri/$basepath/subscriptions/$name/state" \
    | jq .
}

pause_webhook_subscription() {
  local name=$1
  if [[ -z "$name" ]]; then
    err Usage: pause_webhook_subscription name
    exit 1
  fi
  log "Pausing webhook subscription $name"
  _set_subscription_state "$name" pause
}

resume_webhook_subscription() {
  local name=$1
  if [[ -z "$name" ]]; then
    err Usage: resume_webhook_subscription name
    exit 1
  fi
  log "Resuming webhook subscription $name"
  _set_subscription_state "$name" resume
}

consume_message_from_queue() {
  local name=$1
  if [[ -z "$name" ]]; then
    err Usage: consume_message_from_queue name
    exit 1
  fi
  log "Consume message from queue $queue"
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --header "x-qos: $qos" \
    --request POST \
    "$uri/$basepath/queues/$name/messages/consumption"
  echo
}

acknowledge_message_consumption() {
  local name=$1
  local messageid=$2
  if [[ -z "$name" ]] || [[ -z "$messageid" ]]; then
    err Usage: acknowledge_message_consumption name messageid
    exit 1
  fi
  log "Acknowledge consumption of message $messageid from queue $queue"
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request POST \
    "$uri/$basepath/queues/$name/messages/$messageid/acknowledgement"
}

messaging_functions() {

  cat << EO_MESSAGING_FUNCTIONS
publish_message_to_topic
publish_message_to_queue
list_webhook_subscriptions
get_webhook_subscription
create_webhook_subscription
delete_webhook_subscription
trigger_handshake_request
pause_webhook_subscription
resume_webhook_subscription
consume_message_from_queue
acknowledge_message_consumption
EO_MESSAGING_FUNCTIONS
}
