#!/usr/bin/env bash

# Management API functions

declare output token uri
basepath=hub/rest/api/v1/management/messaging

function create_update_queue() {
  local queue=$1
  if [[ -z "$queue" ]]; then
    err Usage: create_update_queue queue
    exit 1
  fi
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request PUT \
    "$uri/$basepath/queues/$queue" \
    | jq .
}

function delete_queue() {
  local queue=$1
  if [[ -z "$queue" ]]; then
    err Usage: delete_queue queue
    exit 1
  fi
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request DELETE \
    "$uri/$basepath/queues/$queue"
}

function get_queue() {
  local queue=$1
  if [[ -z "$queue" ]]; then
    err Usage: get_queue queue
    exit 1
  fi
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request GET \
    "$uri/$basepath/queues/$queue" \
    | jq .
}

function list_queues() {
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request GET \
    "$uri/$basepath/queues" \
    | jq .
}

function list_queue_subscriptions() {
  local queue=$1
  if [[ -z "$queue" ]]; then
    err Usage: list_queue_subscriptions queue
    exit 1
  fi
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request GET \
    "$uri/$basepath/queues/$queue/subscriptions" \
    | jq .
}

function create_update_queue_subscription() {
  local queue=$1
  local topic=$2
  if [[ -z "$queue" ]] || [[ -z "$topic" ]]; then
    err Usage: create_update_queue_subscription queue topic
    exit 1
  fi
  topic="$(echo -n "$topic" | url-encode)"
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request PUT \
    "$uri/$basepath/queues/$queue/subscriptions/$topic" \
    | jq .
}

function delete_queue_subscription() {
  local queue=$1
  local topic=$2
  if [[ -z "$queue" ]] || [[ -z "$topic" ]]; then
    err Usage: delete_queue_subscription queue topic
    exit 1
  fi
  topic="$(echo -n "$topic" | url-encode)"
  curl \
    --"$output" \
    --header "Authorization: Bearer $token" \
    --request DELETE \
    "$uri/$basepath/queues/$queue/subscriptions/$topic"
}

management_functions() {
  cat << EO_MANAGEMENT_FUNCTIONS
create_update_queue
delete_queue
get_queue
list_queues
list_queue_subscriptions
create_update_queue_subscription
delete_queue_subscription
EO_MANAGEMENT_FUNCTIONS
}
