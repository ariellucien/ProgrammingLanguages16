-- Curso de programación funcional

-- 		Guards
-- Son una manera de hacer OR o if's anidados
-- se utilizan los pipes | para separar cada OR o cada IF
-- van en seguida de los parámetros de una función. La función se escribe sin signo de igual
-- en caso de que ninguna condición se cumpla, podemos agregar la clausula "otherwise" 

	saludoInicial hora
		| hora>=0 && hora<12   = "buenos dias"
		| 12<=hora && hora<19  = "buenas tardes"
		| 19<=hora  && hora<=24 = "buenas noches"
		| otherwise = "hora erronea"
 
-- Si la expresión que se evalúa en cada Guard es la misma, entonces es posible sustituirla por
-- una función utulizando binding mediante WHERE

	suficienteDinero cantX cantY
		| sum > 100 = "tienes suficiente dinero"
		| sum > 0 && sum < 100 = "no tienes suficiente dinero"
		| otherwise = "hasta me sales debiendo"
		where sum = cantX + cantY

-- se puede hacer binding de valores con nombres de "variables"
	
	suficienteDineroOtra cantX cantY
		| sum <= unDiego = "eres pobre"
		| sum <= unaManita && sum > unDiego = "eres pudiente"
		| otherwise = "ni figuras"
		where sum = cantX + cantY
		      unDiego = 100
		      unaManita = 500

--                     CASE expressions
-- son muy similares al case de C++, pero en este no solo se evalúa un valor de los parámetros
-- sino que también se puede utilizar con pattern matching

	theHead x = case x of [] -> error 
			      (x:_) -> x

-- note que el binding de valores con nombres están indentados en la misma columna para Haskell sepa
-- de qué se trata
	
-- 			Temas a Revisar
--	map (instruction)
--	
--	lambda lifting
-- 	ETA expansion
			
