#ifndef {{ toupper(substitute(expand('%:t'), '\.', '_', 'g')) }}
#define {{ toupper(substitute(expand('%:t'), '\.', '_', 'g')) }} 1
#include <sys/cdefs.h>
__BEGIN_DECLS

{% here %}

__END_DECLS
#endif /* {{ expand('%:t') }} */
