#!/bin/bash

FILE_JSON='hh.json'
VACANCIES_AMOUNT=50

# Замента символа пробела в аргументе (название вакансии) для поиска на валидный символ '+'

VACANCY_NAME="${1/ /+}"

# -k    небезопасный поиск
# -H    Заголовок запроса
# https://habr.com/ru/company/hh/blog/303168/

curl -k -H 'User-Agent: api-test-agent' "https://api.hh.ru/vacancies?text=$VACANCY_NAME&per_page=$VACANCIES_AMOUNT" | jq > $FILE_JSON
