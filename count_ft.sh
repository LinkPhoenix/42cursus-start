setup_color() {
    # Only use colors if connected to a terminal
    # Thank your Oh My ZSH
    if [ -t 1 ]; then
        # https://gist.github.com/vratiu/9780109
        # https://misc.flogisoft.com/bash/tip_colors_and_formatting
        #RESET
        RESET=$(printf '\033[m')

        # Regular Colors
        BLACK=$(printf '\033[30m')
        RED=$(printf '\033[31m')
        GREEN=$(printf '\033[32m')
        YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        MAGENTA=$(printf '\033[35m')
        CYAN=$(printf '\033[36m')
        WHITE=$(printf '\033[37m')

        #BACKGROUND
        BG_BLACK=$(printf '\033[40m')
        BG_RED=$(printf '\033[41m')
        BG_GREEN=$(printf '\033[42m')
        BG_YELLOW=$(printf '\033[43m')
        BG_BLUE=$(printf '\033[44m')
        BG_MAGENTA=$(printf '\033[45m')
        BG_CYAN=$(printf '\033[46m')
        BG_WHITE=$(printf '\033[47m')

        # Formatting
        BOLD=$(printf '\033[1m')
        DIM=$(printf '\033[2m')
        ITALIC=$(printf '\033[3m')
        UNDERLINE=$(printf '\033[4m')
        BLINK=$(printf '\033[5m')
        REVERSE=$(printf '\033[7m')

    else
        RESET=""

        # Regular Colors
        BLACK=""
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""

        #BACKGROUND
        BG_BLACK=""
        BG_RED=""
        BG_GREEN=""
        BG_YELLOW=""
        BG_BLUE=""
        BG_MAGENTA=""
        BG_CYAN=""
        BG_WHITE=""

        # Formatting
        BOLD=""
        DIM=""
        ITALIC=""
        UNDERLINE=""
        BLINK=""
        REVERSE=""
    fi
}

get_ft() {
	TYPE_VAR=("void" "char" "signed char" "unsigned char" \
	"short" "short int" "signed short" "signed short int" \
	"unsigned short" "unsigned short int" \
	"int" "signed int" "unsigned int" \
	"long" "long int" "signed long" "signed long int" \
	"unsigned long" "unsigned long int" \
	"long long" "long long int" "signed long long" "signed long long int" \
	"unsigned long long" "unsigned long long int" \
	"float" "double double float", "long double long", "double float" \
	"static")

	TOTAL=${#TYPE_VAR[*]}

	for (( i=0; i<=$(( $TOTAL -1 )); i++ ))
	do 
		cat *.c 2>/dev/null | grep "^${TYPE_VAR[$i]}\t.*[)]$" 2>/dev/null
	done

	TYPE_VAR_STRUCT=("size_t" "t_list")

	TOTAL=${#TYPE_VAR_STRUCT[*]}

	for (( i=0; i<=$(( $TOTAL -1 )); i++ ))
	do 
		cat *.c 2>/dev/null | grep "^${TYPE_VAR_STRUCT[$i]}\t.*[)]$" 2>/dev/null
	done
}

main() {
	setup_color
	result=$(get_ft | wc -l | tr -d ' ')
	SOURCE_CODE=$(find . -name "*.c" | wc -l | tr -d ' ')
	echo "I found ${YELLOW}${SOURCE_CODE}${RESET} .c file(s)"
	echo "You have ${YELLOW}${result}${RESET} fonction(s)"
}

main