# Nvidia

https://www.reddit.com/r/archlinux/comments/1b9ym44/horrible_kde_6_experience_more_nvidia_bs/

## Unpredictable screen corruption after waking from suspend

This is most likely because you don't have NVreg_PreserveVideoMemoryAllocations=1 and the nvidia-suspend, nvidia-resume, and nvidia-hibernate systemd services enabled. Check your modprobe.d and make sure your nvidia kernel options are set correctly. Here's mine for reference:

options nvidia_drm modeset=1
options nvidia NVreg_PreserveVideoMemoryAllocations=1

______________________________________________________________________
Honestly? I always needed to put parametr like options nvidia_drm modeset=1, no matter if I used KDE, GNOME, Xfce, LXDE or LXQt, I remember that on my laptop with GTX1050-Ti.

It was even directly mentioned on the Arch Wiki: https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting

nvidia_drm.modeset=1

______________________________________________________________________
From what I understand, NVIDIA stands out like that one unique kid in class, which means NVIDIA GPUs often require special steps.

Step 1
sudo nano etc/modprobe.d/nvidia.conf and insert following:

options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_DynamicPowerManagement=0x02
options nvidia_drm modeset=1 fbdev=1
Step 2
sudo nano etc/udev/rules.d/71-nvidia.rules and insert following:

# Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
ACTION=="bind", SUBSYSTEM=="pci", DRIVERS=="nvidia", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", TEST=="power/control", ATTR{power/control}="auto"

# Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
ACTION=="unbind", SUBSYSTEM=="pci", DRIVERS=="nvidia", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", TEST=="power/control", ATTR{power/control}="on"
After step 1 and step 2 reboot you computer and see again, it should fix issues.

btw: As I always say, AMD GPU with mesa is always your friend, NVIDIA is just bad evil on Linux.

______________________________________________________________________