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
		cat *.c | grep "^${TYPE_VAR[$i]}\t.*[)]$" | sed s'/.$/);/'
	done

	TYPE_VAR_STRUCT=("size_t" "t_list")

	TOTAL=${#TYPE_VAR_STRUCT[*]}

	for (( i=0; i<=$(( $TOTAL -1 )); i++ ))
	do 
		cat *.c | grep "^${TYPE_VAR_STRUCT[$i]}\t.*[)]$" | sed s'/.$/);/'
	done
}

main() {
	get_ft | wc -l | tr -d ' '
}

main