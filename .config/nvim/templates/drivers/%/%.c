#include <linux/module.h>

MODULE_LICENSE("Dual BSD/GPL");
MODULE_AUTHOR("{{ g:snips_author }}");
MODULE_DESCRIPTION("");
MODULE_VERSION("0.0.1");

static int __init {{ expand('%:p:h:t') }}_init(void) {
	printk("{{ expand('%:t:r') }}: init\n");
	return 0;
}
static void __exit {{ expand('%:p:h:t') }}_exit(void) {
	printk("{{ expand('%:t:r') }}: exit\n");
}

module_init({{ expand('%:p:h:t') }}_init);
module_exit({{ expand('%:p:h:t') }}_exit);
// ex: tabstop=8
