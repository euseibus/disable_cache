# disable_cache
Linux kernel module that disables the CPU cache - taken from http://www.linuxquestions.org/questions/linux-kernel-70/disabling-cpu-caches-936077/

#Other suggestions on linuxquestions

```Assembly
static inline void cache_off(void)
{
        asm(
		"push %eax\n\t"
		"movl %cr0,%eax\n\t"
                "orl $0x40000000,%eax\n\t"  /* Set CD */
                "movl %eax,%cr0\n\t"
		"wbinvd\n\t"
		"pop  %eax\n\t");
}
```

```C
int main(int argc, char **argv) {
	int i, j;
	char memory[1024];

	for (i = 0; i < 1000; ++i) {
		for (j = 0; j < 1023; ++j) {
			memory[j] = memory[j+1]+1;
		}
	}
	return 0;
}
```

```Shell
perf stat -e L1-dcache-load-misses ./cachetest
```