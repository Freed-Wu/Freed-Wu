#include <linux/miscdevice.h>
#include <linux/module.h>
#include <linux/platform_device.h>

#define DRIVER_NAME "{{ expand('%:p:h:t') }}"
MODULE_LICENSE("Dual BSD/GPL");
MODULE_AUTHOR("{{ g:snips_author }}");
MODULE_DESCRIPTION("platform for " DRIVER_NAME);
MODULE_VERSION("0.0.1");

static int open(struct inode *inode, struct file *file) {
	pr_notice_once(DRIVER_NAME ": open\n");
	return 0;
}

static int release(struct inode *inode, struct file *file) {
	pr_notice_once(DRIVER_NAME ": release\n");
	return 0;
}

static struct file_operations fops = {
	.owner = THIS_MODULE,
	.open = open,
	.release = release,
};

static struct miscdevice misc = {
	.name = DRIVER_NAME,
	.minor = MISC_DYNAMIC_MINOR,
	.fops = &fops,
};

static int probe(struct platform_device *pdev) {
	return misc_register(&misc);
}
static int remove(struct platform_device *pdev) {
	misc_deregister(&misc);
	return 0;
}

static struct platform_driver platform = {
	.driver =
		{
			.name = DRIVER_NAME,
			.owner = THIS_MODULE,
		},
	.probe = probe,
	.remove = remove,
};

module_platform_driver(platform);
// ex: tabstop=8
