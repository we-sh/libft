#include <stdint.h>
#include <stdarg.h>
#include "libftprintf.h"

char				*ft_printf_fill_b(t_printf_args *el, va_list ap)
{
	if (el->type == 'B')
		el->si = 'l';
	if (el->si == 'l')
		return (ft_printf_fill_b_long(el, va_arg(ap, long)));
	if (el->si == ' ')
		return (ft_printf_fill_b_int(el, va_arg(ap, int)));
	else if (el->si == 'H')
		return (ft_printf_fill_b_char(el, (char)va_arg(ap, int)));
	else if (el->si == 'h')
		return (ft_printf_fill_b_short(el, (short)va_arg(ap, int)));
	else if (el->si == 'L')
		return (ft_printf_fill_b_llong(el, va_arg(ap, long long)));
	else if (el->si == 'j')
		return (ft_printf_fill_b_intmax(el, va_arg(ap, intmax_t)));
	else if (el->si == 'z')
		return (ft_printf_fill_b_intmax(el, va_arg(ap, ssize_t)));
	return (ft_printf_fill_b_int(el, va_arg(ap, int)));
}
