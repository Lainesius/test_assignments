from typing import Union


EURO_COINS = [200, 100, 50, 20, 10, 5, 2, 1]


def return_coins(coffee_price: Union[int, float], eur_inserted: Union[int, float]) -> list[int]:
    # sanity check, will raise an exception on bad input type and non-positive or invalid data
    assert (coffee_price > 0) and (eur_inserted > 0) and (eur_inserted >= coffee_price)

    remaining_change = int((eur_inserted - coffee_price) * 100)

    coins_to_return = [0] * len(EURO_COINS)

    for i in range(len(EURO_COINS)):
        if remaining_change == 0:
            break

        if remaining_change < EURO_COINS[i]:
            continue

        coins_to_return[i] = remaining_change // EURO_COINS[i]
        remaining_change = remaining_change % EURO_COINS[i]

    return coins_to_return
