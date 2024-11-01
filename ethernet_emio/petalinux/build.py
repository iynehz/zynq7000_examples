#!/usr/bin/env python

import argparse
import logging
import shutil
import subprocess

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Build this PetaLinux project')
    parser.add_argument('-d', '--dst', type=str,
                        help="Destination directory to copy image files to")
    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    dst = args.dst

    subprocess.run("petalinux-build", shell=True)
    subprocess.run("petalinux-package boot --u-boot --fsbl --force --fpga", shell=True)

    if dst:
        logging.info(f"Copying image files to {dst}")
        for fn in ("BOOT.BIN", "image.ub", 'boot.scr'):
            shutil.copyfile(f"images/linux/{fn}", f"{dst}/{fn}")
    else:
        logging.info(f"Image files are not copied")

    logging.info("build.py finished")

