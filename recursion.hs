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

maximun ([]) = 0
maximun (x:[]) = x
maximun (a:b:c) = if null c
		  then bigger(a,b)
		  else maximun([bigger(a,b)] ++ c)
		       where bigger (a,b) = if a>b then a else b

nums = [6,3,1,8,9,7,2,4] 

-- --------------------------INSERTION SORT -------------------------

-- -----------  v1  --- recursive

insert num [] = [num]
insert num (h:t) = if num > h
		 then if t == []
 		      then [h] ++ [num]
		      else [h] ++ (insert num t)
		 else [num] ++ [h] ++ t 

insertionSort [] = []
insertionSort (h:[]) = [h]
insertionSort (h:t) = insert h (insertionSort t)

-- -----------  v2  --- With LET binding

insertionSortV2 [] = []
insertionSortV2 (h:[]) = [h]
insertionSortV2 (h:t) = let inser num [] = [num]
	                    inser num (h:t) = if num > h
					      then if t == []
					       	   then [h] ++ [num]
						   else [h] ++ (inser num t)
					      else [num] ++ [h] ++ t
			in
			    inser h (insertionSortV2 t)

-- -----------  V3   ---- With LIST COMPREHENSION

insertionSortV3 [] = []
insertionSortV3 (h:[]) = [h]
insertionSortV3 (h:t) = let insertWithListComp x lista = [y | y <- lista, x>=y] 
							   ++ [x] ++ [y | y <- lista, x<y]
			in
			    insertWithListComp h (insertionSortV3 t)





