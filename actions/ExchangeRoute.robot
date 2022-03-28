*Settings*
Documentation       Exchange route

*Keywords*

GET Exchange Rates           

   ${response}     GET
   ...             url=http://api.exchangeratesapi.io/v1/latest?access_key=54843c1d74f8d183fe9c30dabaea269f&symbols=BRL,EUR,USD
   ...             expected_status=any

   ${quote}        Should Convert To Brazil Rate    ${response.json()}[rates][USD]  ${response.json()}[rates][BRL]

    [return]    ${quote}
       




