#include <linux/init.h>
#include <linux/module.h>
static int my_init(void)
{
	printk(KERN_INFO"Hello world loaded\n");
	return  0;
}

static void my_exit(void)
{
	printk(KERN_INFO"Hello world unloaded\n");
	return;
}
module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Srikanth Patchava <srikanth.pappu@hotmail.com>");
MODULE_DESCRIPTION("\"Hello, world!\" minimal module");
MODULE_VERSION("printk 1");
