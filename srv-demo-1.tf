resource "proxmox_vm_qemu" "srv_demo_1" {
    name = "srv-demo-1"
    desc = "ubuntuServer"
    vmid = "100"
    target_node = "pve"
    
    agent = 1

    clone = "ubuntu24.04template"
    cores = 1
    sockets = 1
    cpu = "host"
    memory = 2048
    
    network{
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local"
        type = "virtio"
        size = "20G"
    }

    os_type = "cloud_init"
    ipconfig0 = "ip=192.168.2.1/24, gw=192.168.2.1"
    nameserver = "192.168.2.1"
    ciuser = "xcad"
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC48hmoYD2eKB5en2Gh+aWsDgeXW7j8gJ7yOM+qhF/1NB8k6pOsHLxm5rGwyzY2PvA7uvc7hi1cgjRS44fcEK/qpdZPf0LjzkgVgpPeHMbfie6XWuqjIXN5NCeytjNIdcoxHjPOvK95+sHoeZYtNkDSDIHA0MzHQ52Z6BZGWbEhE1H5iJWULzdOdbfaRr0Ai9uJ/ru6a9oYyEqJ2QXYrIqnF4RtvEOvHCwBRcV1GAzrca89LqdNwyfD62Epac9QjYXoMMm4Pe5ZJ2zaMm/VfaCYNYyWGq/nZr7fuVjg7NDNK1UD4IvPWk8WQr1S1VWqKYYDA50nN1AzZiPOmYIIoVEVegWLVAcAB1dCb/yv68Pdpeo/fFyf/ttrnSXV0expCZLeKBJsS8/353ZByBXjWzFoBmk7B+mnqqnpG6Ih1iTzTYwXBX3eSh0YoM+opOAog5IEwQuaDvgBaPbk3B9WC8Kj1Th1UWHji48cqMvquj1ueL//2gxpcBZmGLc6tcK0qffiFnAnrFCc1ZRpmOxjKEMm18/sPfjXXqvZ52owVRi4ArdDwb03cFCVL3H56/EV8UW5HFJi3WMyvd7YKIrU6BMTEZtC1t3B2BhMA/WUBQefYoiX1HanBY69Z5uvdQUsFd+c542wf2MgJegB/Rd6WB8xjuoWRjTYHblU4mKBGJmJDw== atharva93@hotmail.com
    EOF
}