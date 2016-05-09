# include "list.h"

int			list_len(t_list *head)
{
	t_list	*pos;
	int		ret;

	ret = 0;
	pos = head;
	while ((pos = pos->next) && pos != head)
	{
		ret += 1;
	}
	return (ret);
}
