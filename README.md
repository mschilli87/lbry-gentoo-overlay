# lbry-gentoo-overlay

This repository contains a Gentoo Portage overlay to enable easy installation of the [LBRY.io](http://lbry.io/) suite.

1.	Create `/etc/portage/repos.conf/lbry.conf`, containing:

		[lbry]
		location = /usr/local/portage/overlays/lbry
		sync-type = git
		sync-uri = https://github.com/lbryio/lbry-gentoo-overlay.git
		auto-sync = yes

1.	Synchronize the overlay:

		# emaint sync -r lbry

1.	Emerge `net-p2p/lbry`:

		# emerge -atv net-p2p/lbry

1.	Follow the [instructions for running](https://github.com/lbryio/lbry/blob/master/RUNNING.md#running-lbrycrd) `lbrycrdd` and `lbrynet-console`.
