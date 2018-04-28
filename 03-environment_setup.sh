#!/bin/bash

ANDROID_DIR=$HOME/Android
DEVELOPMENT_DIR=$HOME/Development
DOWNLOAD_DIR=$HOME/Downloads
ANDROID_STUDIO=https://dl.google.com/dl/android/studio/ide-zips/3.1.2.0/android-studio-ide-173.4720617-linux.zip
ANDROID_TOOLCHAIN=https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
ANYKERNEL_REPO=git@github.com:SpasilliumNexus/anykernel2.git
OMNIROM_KERNEL_REPO=git@github.com:SpasilliumNexus/omni-android_kernel_oneplus_msm8996.git
OPENGAPPS_REPO=https://github.com/opengapps/opengapps.git
OPENGAPPS_SN_REPO=git@github.com:SpasilliumNexus/opengapps.git
PHONOGRAPH_REPO=git@github.com:SpasilliumNexus/phonograph.git
SUPERRSKITCHEN_REPO=git@gitlab.com:superr/superrs-kitchen3.git


# Needed for building OpenGapps packages
sudo apt-add-repository ppa:maarten-fonville/android-build-tools -y

# Missing in Ubuntu 18.04: libesd0-dev
sudo apt install -y android-build-tools-installer bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzip lzop openjdk-8-jdk pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev


mkdir $ANDROID_DIR


(cd $DOWNLOAD_DIR; wget $ANDROID_STUDIO)
unzip $DOWNLOAD_DIR/android-studio* -d $ANDROID_DIR
rm $DOWNLOAD_DIR/android-studio*


mkdir -p $ANDROID_DIR/.bin
curl https://storage.googleapis.com/git-repo-downloads/repo > $ANDROID_DIR/.bin/repo
chmod a+x $ANDROID_DIR/.bin/repo


mkdir -p $ANDROID_DIR/toolchains
(cd $ANDROID_DIR/toolchains; git clone $ANDROID_TOOLCHAIN)


(cd $ANDROID_DIR; git clone $ANYKERNEL_REPO)
(cd $ANDROID_DIR/anykernel2; git checkout android-8.1-custom)


(cd $ANDROID_DIR; git clone $SUPERRSKITCHEN_REPO superkitchen)
(cd $ANDROID_DIR/superkitchen; git checkout master)


mkdir -p $DEVELOPMENT_DIR/android-kernels/omnirom
(cd $DEVELOPMENT_DIR/android-kernels/omnirom; git clone $OMNIROM_KERNEL_REPO)
(cd $DEVELOPMENT_DIR/android-kernels/omnirom/omni-android_kernel_oneplus_msm8996; git checkout android-8.1-custom)


(cd $DEVELOPMENT_DIR; git clone $OPENGAPPS_REPO)
(cd $DEVELOPMENT_DIR/opengapps; git checkout master; git remote add spasilliumnexus $OPENGAPPS_SN_REPO)


(cd $DEVELOPMENT_DIR; git clone $PHONOGRAPH_REPO)
(cd $DEVELOPMENT_DIR/phonograph; git checkout unlocked-build)


echo "Open the 04-profile_variables.txt file and follow the instructions given"
read -p "Press [Enter] key to continue..."


echo ""
echo "Setup automation complete!"

