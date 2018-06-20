TWRP device tree for Infinix NOTE 4 Pro Android 8.1 (c) NasreIrma - 2018

=================================

To recovery build in the Lineage OS 15.1 sources

	$ cd $(SOURCE)/bootable
    $ rm -rf recovery
    $ git clone https://github.com/omnirom/android_bootable_recovery recovery
    $ cd recovery

    $ git apply -v ../../device/Infinix/X571/twrp_recovery.patch
    $ cd ../..

	$ . build/envsetup.sh
    $ breakfast X571
	$ make clean
	$ make recoveryimage
	
	
All Credits goes to
     Hyperion70
