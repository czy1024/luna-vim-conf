
delimiter // 
# 子查父
CREATE FUNCTION `getFatherByChild`(rootId INT)
RETURNS varchar(1000) 
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempPar VARCHAR(1000); 
    SET sTemp = ''; 
    SET sTempPar =rootId; 

    #循环递归
    WHILE sTempPar is not null DO 
        #判断是否是第一个，不加的话第一个会为空
        IF sTemp != '' THEN
            SET sTemp = concat(sTemp,',',sTempPar);
        ELSE
            SET sTemp = sTempPar;
        END IF;
        SET sTemp = concat(sTemp,',',sTempPar); 
        SELECT group_concat(f_pid) INTO sTempPar FROM treenodes where f_pid<>f_id and FIND_IN_SET(f_id,sTempPar)>0; 
    END WHILE; 

RETURN sTemp; 
END
//
select * from biz_organization where FIND_IN_SET(f_id,getFatherByChild(1)) ;

# 父查子
delimiter // 
CREATE FUNCTION `getChildByFather`(rootId INT)
RETURNS varchar(1000) 

BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);

    SET sTemp = '$';
    SET sTempChd =cast(rootId as CHAR);

    WHILE sTempChd is not null DO
        SET sTemp = concat(sTemp,',',sTempChd);
        SELECT group_concat(f_id) INTO sTempChd FROM  biz_organization where FIND_IN_SET(f_pid,sTempChd)>0;
    END WHILE;
    RETURN sTemp; 
END
//

select * from biz_organization where FIND_IN_SET(f_id,getChildByFather(1));

select CASE
		f_sex 
		WHEN '0' THEN
		'男' 
		WHEN '1' THEN
		'女' 
	END AS sex , count(*) as 'count' from biz_user group by f_sex

