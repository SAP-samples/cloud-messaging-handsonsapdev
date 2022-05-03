# Cloud - Messaging - Hands-on SAP Dev

[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/cloud-messaging-handsonsapdev)](https://api.reuse.software/info/github.com/SAP-samples/cloud-messaging-handsonsapdev)

## Description

For the host and participants of the [Hands-on SAP Dev](https://www.youtube.com/playlist?list=PL6RpkC85SLQABOpzhd7WI-hMpy99PxUo0) live stream show to share discoveries & scripting efforts in the collective dive into messaging on SAP Business Technology Platform - specifically in the
[Diving into messaging on SAP Business Technology Platform](https://www.youtube.com/playlist?list=PL6RpkC85SLQCf--P9o7DtfjEcucimapUf) series.

**New (30 Oct 2020)** For the current [Graphing SAP Enterprise Messaging Artifacts](https://www.youtube.com/playlist?list=PL6RpkC85SLQB9d462qCFLv2BW4o37ZaIC) miniseries, there's a new [graphing](graphing/) subdirectory in this repo, with its own README with info on the tools, and all the resources we're creating together.

## Requirements

The scripts in this repo are Bash shell scripts. Therefore, to try these scripts out yourself, you'll need a Bash shell, which is available on macOS, Linux and Windows (with the Windows Subsystem for Linux). You will need some basic tools, in particular [`jq`](https://stedolan.github.io/jq/), [`yq`](https://github.com/mikefarah/yq) and [`curl`](https://curl.haxx.se/). You'll also need [`cf`](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html), the Cloud Foundry CLI. If you want to try out the CAP projects you'll need a Node.js installation of the SAP Cloud Application Programming Model - see the [CAP documentation](https://cap.cloud.sap) for details.

### Using the SAP Business Application Studio

Of course, there's also a Bash shell in the SAP Business Application Studio (App Studio), which is wonderful. If you want to use that, there's a little script [`appstudiosetup`](appstudiosetup) that you can use to set things up. Currently it will install `yq` and `jq` into a user-local executable directory (`bin` in your home directory), and also URL encoding utilities (from NPM package [`url-decode-encode-cli`](https://www.npmjs.com/package/url-decode-encode-cli)); `url-encode` in particular is [used](https://github.com/SAP-samples/cloud-messaging-handsonsapdev/commit/abd11d480b7719380ceaa6b92dfb642005643765) in the `management` and `messaging` scripts.

Once you've got an App Studio dev space set up and running, clone this repository (use the 'Clone from git' link in the Welcome page and use this url `https://github.com/SAP-samples/cloud-messaging-handsonsapdev.git`), open a terminal, and run the script:

```
user: user $ ./projects/cloud-messaging-handsonsapdev/bas-setup
Installing yq ...
Installing jq ...
...
+ url-decode-encode-cli@0.1.1
updated 1 package in 0.156s
Please now restart the terminal (Ctrl-D then Ctrl-`) to have the new shell settings take effect ...
user: user $
```

Follow the instructions and start a new terminal, and you're all set.

## Download and installation

To enjoy these scripts, you don't have to download or install anything. But you can of course clone this repository to have the content available to you locally.

## Support

Support for the content in this repository is available during the [Hands-on SAP Dev](https://www.youtube.com/playlist?list=PL6RpkC85SLQABOpzhd7WI-hMpy99PxUo0) live stream episodes, specifically in the
[Diving into messaging on SAP Business Technology Platform](https://www.youtube.com/playlist?list=PL6RpkC85SLQCf--P9o7DtfjEcucimapUf) series. Otherwise, this content is provided "as-is" with no other support.

## Contributing

If you wish to raise an issue, please use the [issues](issues) facility in this repo, but bear in mind the scope of support described above. If you wish to contribute code, offer fixes or improvements, please send a pull request (PR). Due to legal reasons, contributors will be asked to accept a [Developer Certificate of Origin (DCO)](https://en.wikipedia.org/wiki/Developer_Certificate_of_Origin) on submitting their first PR to this project. This DCO acceptance can be done in the PR itself - look out for the CLA assistant that will guide you through the simple process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## Code of conduct

SAP adopts the Contributor's Covenant 2.0 across our open source projects to ensure a welcoming and open culture for everyone involved. Please follow the standard Code of Conduct link in this repository to find out more.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.
