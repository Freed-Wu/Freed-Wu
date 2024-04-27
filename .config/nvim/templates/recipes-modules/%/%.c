#include <linux/module.h>
#include <linux/platform_device.h>

#define DRIVER_NAME "{{ expand('%:p:h:t') }}"
MODULE_LICENSE("Dual BSD/GPL");
MODULE_AUTHOR("{{ g:snips_author }}");
MODULE_DESCRIPTION(DRIVER_NAME);
MODULE_VERSION("0.0.1");

static void release(struct device *device)
{
	pr_notice_once(DRIVER_NAME ": release");
}

static struct platform_device pdev = {
	.name = DRIVER_NAME,
	.id = 1,
	.dev = {
		.release = release,
	},
};

module_driver(pdev, platform_device_register, platform_device_unregister);
// ex: tabstop=8
