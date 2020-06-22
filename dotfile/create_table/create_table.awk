function getUnderScore(str) {
    gsub(/;/,"",str)
    match(str,/(.*)([a-z0-9])([A-Z])(.*)/,cap)
    ret = cap[1] cap[2] "_" tolower(cap[3]) cap[4]
    return ret
}

function getMysqlType(javaType) {
    switch(javaType) {
        case /String/ : return "VARCHAR(255)"
        case /int|Integer/ : return "INT"
        case /long|Long/ : return "BIGINT"
        case /boolean|Boolean/ : return "BIT"
        case /BigDecimal/ : return "DECIMAL"
        case /Date/ : return "DATE"
    }
}

$0!~/^$|}/{
    if(match($0,/.*class.*/)) {
        tableName = getUnderScore($3)
        printf("CREATE TABLE `%s` (\n", tableName);
    } else {
        columnName = getUnderScore($3)
        columnType = getMysqlType($2)
        printf("    `%s` %s NOT NULL,\n", columnName, columnType)
    }
}

END{
    printf(") ENGINE=InnoDB DEFAULT CHARSET=utf8;\n")
}