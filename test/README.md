# `test`

Katalog för testprogram och testkörningar, inspirerad av idéer från testdriven
utveckling *(TDD)*. I det här fallet dock mycket förenklat.


| **Namn**                    | **Beskrivning**                                |
| --------------------------- | ---------------------------------------------- |
| `run_test`                  | skapas innan varje testkörning                 |
| `target`                    | dummy målstruktur                              |
| `run-test.sh`               | testprogrammet (test "runner")                 |


Jämför förväntat (önskvärt) resultat med det faktiska resultat man får vid
körning. Själva jämförelsen ska såklart skötas av programmet, men
implementering av något sådant ligger långt utanför vad som förväntas ingå i
den här laborationen.
