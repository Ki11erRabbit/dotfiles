;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (gnu packages wm)
             (gnu packages xdisorg)
             (gnu packages shells))
(use-modules (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups pm desktop sound networking ssh xorg)

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (locale "en_US.utf8")
  (timezone "America/Denver")
  (keyboard-layout (keyboard-layout "us" "colemak_dh"))
  (host-name "guixwork")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (shell (file-append zsh "/bin/zsh"))
                  (name "ki11errabbit")
                  (comment "Alec Davis")
                  (group "users")
                  (home-directory "/home/ki11errabbit")
                  (supplementary-groups '("wheel" "netdev" "audio" "video" "netdev")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (map specification->package 
                         (list 
                          "zsh"
			              "dbus"
			              "gnome"
			              "firefox"
			              "wayland"
			              "wayland-protocols"
			              "xorg-server-xwayland"
			              "gcc-toolchain"
			              "cmake"
			              "make"
			              "pkg-config"
			              "libvterm"
			              "git"
			              "stow"
			              "emacs"
				          "zsh"
                          "neovim"
                          "kakoune"
                          "qtile"
                          "bemenu"
                          "alacritty")) %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list
                 ;; To configure OpenSSH, pass an 'openssh-configuration'
                 ;; record as a second argument to 'service' below.
                 (service openssh-service-type)
                 (service cups-service-type)
                 ;(udev-rules-service 'pipewire-add-udev-rules pipewire)
                 (service power-profiles-daemon-service-type)
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout keyboard-layout))))

           ;; This is the default list of services we
           ;; are appending to.
           (modify-services %desktop-services
             (guix-service-type config => (guix-configuration
               (inherit config)
               (substitute-urls
                 (append (list "https://substitutes.nonguix.org")
                   %default-substitute-urls))
               (authorized-keys
                 (append (list (local-file "./nonguix-signing-key.pub"))
                   %default-authorized-guix-keys)))))))
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "651337b4-50f6-4157-b810-a85a38923b73")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "8F2E-BCA2"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "b9953d9e-0341-4157-b09d-7ab2efa9dc60"
                                  'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/home")
                         (device (uuid
                                  "eb4c53a3-85d4-4db4-9e4f-d0356241d47b"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
