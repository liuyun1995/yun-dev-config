function getUnderScore(str) {
    gsub(/;/, "", str)
    while(match(str, /[A-Z]/)) {
        s1 = substr(str, 0, RSTART - 1)
        s2 = substr(str, RSTART, RLENGTH)
        s3 = substr(str, RSTART + RLENGTH)
        if(s2 == "") { continue }
        if(s1 == "") {
            str = tolower(s2)s3
        } else {
            str = s1"_"tolower(s2)s3
        }
    }
    return str
}

function getMysqlType(javaType) {
    if(javaType ~ /String/) {
        return "VARCHAR(255)"
    }
    if(javaType ~ /int|Integer/) {
        return "INT"
    }
    if(javaType ~ /long|Long/) {
        return "BIGINT"
    }
    if(javaType ~ /boolean|Boolean/) {
        return "BIT"
    }
    if(javaType ~ /BigDecimal/) {
        return "DECIMAL"
    }
    if(javaType ~ /Date/) {
        return "DATE"
    }
    return "NULL"
}

$0!~/^$|}/{
    if(match($0, /.*class.*/)) {
        tableName = getUnderScore($3)
        printf("DROP TABLE `%s`;\n", tableName)
        printf("CREATE TABLE `%s` (\n", tableName)
    } else {
        columnName = getUnderScore($3)
        columnType = getMysqlType($2)
        if(key == "") { key = columnName }
        printf("    `%s` %s NOT NULL,\n", columnName, columnType)
    }
}

END{
    printf("    PRIMARY KEY (`%s`)\n", key)
    printf(") ENGINE=InnoDB DEFAULT CHARSET=utf8;\n")
}
