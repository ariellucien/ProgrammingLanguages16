maxmin values = let h = head values
		in if null (tail values)
		   then (h,h)
		   else ( if h > t_max then h else t_max
			, if h < t_min then h else t_min)
			where t = maxmin (tail values)
			      t_max = fst t
			      t_min = snd t

maximo (a:[]) = a
maximo (a:b:t) = let mayor (a,b) = if a>b then a else b
                 in if null t
                    then mayor(a,b)
                    else maximo ([mayor(a,b)] ++ t)

maximun (a:b:c) = if null 
		  then bigger(a,b)
		  else maximun([bigger(a,b)] ++ c)
		       where bigger (a,b) = if a>b then a else b

