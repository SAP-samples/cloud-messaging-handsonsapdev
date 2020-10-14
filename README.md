# Cloud - Messaging - Hands-on SAP Dev

[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/cloud-messaging-handsonsapdev)](https://api.reuse.software/info/github.com/SAP-samples/cloud-messaging-handsonsapdev)

## Description

For the host and participants of the [Hands-on SAP Dev](https://www.youtube.com/playlist?list=PL6RpkC85SLQABOpzhd7WI-hMpy99PxUo0) live stream show to share discoveries & scripting efforts in the collective dive into messaging on SAP Cloud Platform - specifically in the
[Diving into messaging on SAP Cloud Platform](https://www.youtube.com/playlist?list=PL6RpkC85SLQCf--P9o7DtfjEcucimapUf) series.

## Requirements

The scripts in this repo are Bash shell scripts. Therefore, to try these scripts out yourself, you'll need a Bash shell, which is available on macOS, Linux and Windows (with the Windows Subsystem for Linux). You will need some basic tools, in particular [`jq`](https://stedolan.github.io/jq/), [`yq`](https://github.com/mikefarah/yq) and [`curl`](https://curl.haxx.se/). You'll also need [`cf`](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html), the Cloud Foundry CLI. If you want to try out the CAP projects you'll need a Node.js installation of the SAP Cloud Application Programming Model - see the [CAP documentation](https://cap.cloud.sap) for details.

There are other tools used too:

- NPM package [`url-decode-encode-cli`](https://www.npmjs.com/package/url-decode-encode-cli) for URL encoding topic names that contain e.g. slashes (install with `npm i -g url-decode-encode-cli`). [Now used](https://github.com/SAP-samples/cloud-messaging-handsonsapdev/commit/abd11d480b7719380ceaa6b92dfb642005643765) in the `management` and `messaging` scripts.


## Download and installation

To enjoy these scripts, you don't have to download or install anything. But you can of course clone this repository to have the content available to you locally.

## Support

Support for the content in this repository is available during the [Hands-on SAP Dev](https://www.youtube.com/playlist?list=PL6RpkC85SLQABOpzhd7WI-hMpy99PxUo0) live stream episodes, specifically in the
[Diving into messaging on SAP Cloud Platform](https://www.youtube.com/playlist?list=PL6RpkC85SLQABOpzhd7WI-hMpy99PxUo0) series. Otherwise, this content is provided "as-is" with no other support.

## Contributing

If you wish to raise an issue, please use the [issues](issues) facility in this repo, but bear in mind the scope of support described above. If you wish to contribute code, offer fixes or improvements, please send a pull request (PR). Due to legal reasons, contributors will be asked to accept a [Developer Certificate of Origin (DCO)](https://en.wikipedia.org/wiki/Developer_Certificate_of_Origin) on submitting their first PR to this project. This DCO acceptance can be done in the PR itself - look out for the CLA assistant that will guide you through the simple process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.
