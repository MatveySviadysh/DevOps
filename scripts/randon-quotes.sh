#!/bin/bash

QUOTE=$(curl -s https://api.quotable.io/random | jq -r '.content')
echo "Random Quote: $QUOTE