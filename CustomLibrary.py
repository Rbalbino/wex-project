
class CustomLibrary:

    def the_percentage_should_be_at_least(self, total, count, expected_perc):
        perc = count*100/total
        if perc < float(expected_perc):
            raise ValueError(f"Percentage of {expected_perc}% not reached")



    def should_convert_to_brazil_rate(self, usd, brl):
        brl_rate = 1/float(usd)*float(brl)
        print(brl_rate)
        return brl_rate

    def get_highest_value(self, prices):
        highest = 0

        for price in prices:
            value = float(price[3:].replace(".","").replace(",","."))
            print(price[3:])
            if value >  highest:
                highest = value
        return highest

    def get_usd_value(self, usd, brl):
        return  brl/usd

    def it_should_not_be_greater_than(self, value, expected_value):
        if value > float(expected_value):
           raise ValueError(f"Should not be grater than U${expected_value}, but got U${value}")
           



   
