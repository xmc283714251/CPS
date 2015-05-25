CREATE OR REPLACE FUNCTION F_GET_GXXZSQCCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--管辖行政社区个数
AS
       V_LEVE     NUMBER;
       V_COUNT    NUMBER;
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       IF V_LEVE=1 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5' AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,2)||'%';

       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5' AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,4)||'%';

       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5' AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,6)||'%';

       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5' AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND SSPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';

       ELSIF V_LEVE=5 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5' AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND SSJWSDM=V_ORGCODE;

      END IF;
      RETURN  V_COUNT;
END;
/
CREATE OR REPLACE FUNCTION F_GET_XZCSCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--行政村数
AS
       V_LEVE     NUMBER;
       V_COUNT    NUMBER;
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       IF V_LEVE=1 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND DM LIKE SUBSTR(V_ORGCODE,1,2)||'%';

       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                 AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND DM LIKE SUBSTR(V_ORGCODE,1,4)||'%';

       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND DM LIKE SUBSTR(V_ORGCODE,1,6)||'%';

       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND SSPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';

       ELSIF V_LEVE=5 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND SSJWSDM=V_ORGCODE;

      END IF;
      RETURN  V_COUNT;
END;
/

CREATE OR REPLACE PROCEDURE P_EXEC_PCSJBQKTJ
AS
       CURSOR CUR_LIST IS
              SELECT ORGCODE,ORGNAME,LEVE,PARENT_CODE
              FROM T_COMMON_ORGANIZATION_SJJS
              WHERE LEVE<=4;
      TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
      LIST LISTTYPE;
      V_ZJLS        NUMBER;--总警力数
      V_PCSZS        NUMBER;--派出所数
      V_PCSJLS      NUMBER;--派出所警力数

      V_PCSZFJS     NUMBER;--派出所辅警总数
      V_PCSZFBZFJS  NUMBER;--派出所政法编制辅警数
      V_PCSLDRKXGYS NUMBER;--派出所流动人口与出租屋协管员数
      V_PCSXFDYS    NUMBER;--派出所巡防队员数

      V_SQJWSFJS    NUMBER;--社区警务室辅警数
      V_SQJWSS      NUMBER;--社区警务室数
      V_SQMJS       NUMBER;--社区民警数
      V_NCJWSS      NUMBER;--农村警务室数量
      V_ZCMJS       NUMBER;--驻村民警数
      V_JWSLGANWS     NUMBER;--社区警务室接入公安内网数
      V_STPZS       NUMBER; --省厅批准数
      V_JSQJWSS     NUMBER;  --建社区警务室数

      V_SQJWSPBZFBZFJS NUMBER; --社区(驻村)警务室配备政法编制辅警数
      V_SQJWSPBLKXGYS  NUMBER; --社区(驻村)警务室配备流动人口与出租屋协管员数
      V_SQJWSPBXFDYS   NUMBER; --社区(驻村)警务室配备巡防队员数
      V_SQJWSLWS        NUMBER; --社区警务室联网数
      V_NCJWSLWS       NUMBER;--农村警务室联网数
      V_ERROR         VARCHAR2(300);
BEGIN
      DELETE FROM T_COMMON_PCSJBQKTJB;
      COMMIT;
      OPEN CUR_LIST;
      LOOP
             FETCH CUR_LIST BULK COLLECT
             INTO LIST LIMIT 100;
             EXIT WHEN LIST.COUNT = 0;
             --循环 当前的1000条数据
             FOR I IN LIST.FIRST .. LIST.LAST LOOP
                 BEGIN
                     --获取总警力数
                     SELECT F_GET_ORGMJS(LIST(I).ORGCODE) INTO V_ZJLS FROM DUAL;

                     --派出所数量
                     SELECT COUNT(1) INTO V_PCSZS
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE='4' AND ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                     --派出所警力数
                    SELECT COUNT(1) INTO V_PCSJLS
                    FROM V_COMMON_USER U
                         INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
                    WHERE U.ISVALID='1'
                          AND O.ORGCODE IN (
                              SELECT ORGCODE FROM V_COMMON_ORGANIZATION S
                              WHERE S.LEVE>=4
                                    AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%'
                          );
                   --派出所总辅警数
                   SELECT COUNT(1) INTO V_PCSZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4 and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --派出所政法编制辅警数
                   SELECT COUNT(1) INTO V_PCSLDRKXGYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4
                         AND F.FJLB='3' and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --派出所流动人口与出租屋协管员数
                   SELECT COUNT(1) INTO V_PCSZFBZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4
                         AND F.FJLB='1' and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';


                   --派出所巡防队员数
                   SELECT COUNT(1) INTO V_PCSXFDYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4
                         AND F.FJLB='2' and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';


                   --社区警务室配备辅警数
                   SELECT COUNT(1) INTO V_SQJWSFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --警务室数
                   SELECT COUNT(1) INTO V_SQJWSS
                   FROM T_COMMON_ORGANIZATION_SJJS S
                   WHERE LEVE=5  AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --建社区警务室数
                   SELECT COUNT(1) INTO V_JSQJWSS
                   FROM T_COMMON_ORGANIZATION_SJJS S INNER JOIN T_COMMON_ORGANIZATION_OTHER OT ON S.ORGCODE=OT.ORGCODE
                   WHERE S.LEVE=5  AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%' AND OT.SFJLJWS='1';

                   --社区民警数
                   SELECT COUNT(1) INTO V_SQMJS
                   FROM V_COMMON_USER U
                         INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
                   WHERE U.ISVALID='1'
                          AND O.ORGCODE IN (
                              SELECT ORGCODE FROM T_COMMON_ORGANIZATION_SJJS S
                              WHERE S.LEVE=5
                                    AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%'
                          );

                   --农村警务室数量
                   SELECT COUNT(1) INTO V_NCJWSS
                   FROM V_COMMON_ORGANIZATION O
                       LEFT JOIN T_COMMON_ORGANIZATION_OTHER T ON O.ORGCODE=T.ORGCODE
                   WHERE O.LEVE=5 AND T.SFNCJWS='1'
                        AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --省厅批准数
                   SELECT COUNT(1) INTO V_STPZS
                   FROM V_COMMON_ORGANIZATION O
                       LEFT JOIN T_COMMON_ORGANIZATION_OTHER T ON O.ORGCODE=T.ORGCODE
                   WHERE O.LEVE=4 AND T.SFSTPZ='1'
                        AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --驻村民警数
                   SELECT COUNT(1) INTO V_ZCMJS
                   FROM T_COMMON_USER_LXFS L
                        INNER JOIN V_COMMON_USER U ON L.USERID=U.USERID
                        INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
                   WHERE L.SFZCMJ='1' AND U.ISVALID='1'
                         AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --社区警务室接入公安内网数
                   SELECT COUNT(1) INTO V_JWSLGANWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';


                  --社区(驻村)警务室配备政法编制辅警数
                  SELECT COUNT(1) INTO V_SQJWSPBZFBZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.FJLB='3'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                  --社区(驻村)警务室配备巡防队员数
                   SELECT COUNT(1) INTO V_SQJWSPBXFDYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.FJLB='2'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                  --社区(驻村)警务室配备流动人口与出租屋协管员数
                   SELECT COUNT(1) INTO V_SQJWSPBLKXGYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.FJLB='1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                  
                  --社区警务室联网数
                   SELECT COUNT(1) INTO V_SQJWSLWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1' AND SFNCJWS='0'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                  --农村警务室联网数
                   SELECT COUNT(1) INTO V_NCJWSLWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1' AND SFNCJWS='1'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                        
                   INSERT INTO T_COMMON_PCSJBQKTJB
                    (ID, ORGCODE, ORGNAME, LEVE,PARENTCODE, ZJLS, PCSZS,
                         PCSJLS, PCSZFJS, SQJWSFJS, SQJWSS, SQMJS, NCJWSS, ZCMJS,
                         JWSLGANWS,STPZS,PCSZFBZFJS,PCSLDRKXGYS,PCSXFDYS,SQJWSPBZFBZFJS,
                         SQJWSPBXFDYS,SQJWSPBLKXGYS,JSQJWSS,SQJWSLWS,NCJWSLWS)
                   VALUES
                    (I, LIST(I).ORGCODE, LIST(I).ORGNAME, LIST(I).LEVE,LIST(I).PARENT_CODE, V_ZJLS, V_PCSZS,
                        V_PCSJLS, V_PCSZFJS, V_SQJWSFJS, V_SQJWSS, V_SQMJS, V_NCJWSS, V_ZCMJS,
                        V_JWSLGANWS,V_STPZS,V_PCSZFBZFJS,V_PCSLDRKXGYS,V_PCSXFDYS,V_SQJWSPBZFBZFJS,
                        V_SQJWSPBXFDYS,V_SQJWSPBLKXGYS,V_JSQJWSS,V_SQJWSLWS,V_NCJWSLWS);
                   COMMIT;
               EXCEPTION WHEN OTHERS THEN
                         V_ERROR:=SQLERRM;
               END;
             END LOOP;
       END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE P_EXEC_PCSJBQKTJ
AS
       CURSOR CUR_LIST IS
              SELECT ORGCODE,ORGNAME,LEVE,PARENT_CODE
              FROM T_COMMON_ORGANIZATION_SJJS
              WHERE LEVE<=4;
      TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
      LIST LISTTYPE;
      V_ZJLS        NUMBER;--总警力数
      V_PCSZS        NUMBER;--派出所数
      V_PCSJLS      NUMBER;--派出所警力数

      V_PCSZFJS     NUMBER;--派出所辅警总数
      V_PCSZFBZFJS  NUMBER;--派出所政法编制辅警数
      V_PCSLDRKXGYS NUMBER;--派出所流动人口与出租屋协管员数
      V_PCSXFDYS    NUMBER;--派出所巡防队员数

      V_SQJWSFJS    NUMBER;--社区警务室辅警数
      V_SQJWSS      NUMBER;--社区警务室数
      V_SQMJS       NUMBER;--社区民警数
      V_NCJWSS      NUMBER;--农村警务室数量
      V_ZCMJS       NUMBER;--驻村民警数
      V_JWSLGANWS     NUMBER;--社区警务室接入公安内网数
      V_STPZS       NUMBER; --省厅批准数
      V_JSQJWSS     NUMBER;  --建社区警务室数

      V_SQJWSPBZFBZFJS NUMBER; --社区(驻村)警务室配备政法编制辅警数
      V_SQJWSPBLKXGYS  NUMBER; --社区(驻村)警务室配备流动人口与出租屋协管员数
      V_SQJWSPBXFDYS   NUMBER; --社区(驻村)警务室配备巡防队员数
      V_SQJWSLWS        NUMBER; --社区警务室联网数
      V_NCJWSLWS       NUMBER;--农村警务室联网数
      V_ERROR         VARCHAR2(300);
BEGIN
      DELETE FROM T_COMMON_PCSJBQKTJB;
      COMMIT;
      OPEN CUR_LIST;
      LOOP
             FETCH CUR_LIST BULK COLLECT
             INTO LIST LIMIT 100;
             EXIT WHEN LIST.COUNT = 0;
             --循环 当前的1000条数据
             FOR I IN LIST.FIRST .. LIST.LAST LOOP
                 BEGIN
                     --获取总警力数
                     SELECT F_GET_ORGMJS(LIST(I).ORGCODE) INTO V_ZJLS FROM DUAL;

                     --派出所数量
                     SELECT COUNT(1) INTO V_PCSZS
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE='4' AND ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                     --派出所警力数
                    SELECT COUNT(1) INTO V_PCSJLS
                    FROM V_COMMON_USER U
                         INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
                    WHERE U.ISVALID='1'
                          AND O.ORGCODE IN (
                              SELECT ORGCODE FROM V_COMMON_ORGANIZATION S
                              WHERE S.LEVE>=4
                                    AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%'
                          );
                   --派出所总辅警数
                   SELECT COUNT(1) INTO V_PCSZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4 and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --派出所政法编制辅警数
                   SELECT COUNT(1) INTO V_PCSLDRKXGYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4
                         AND F.FJLB='3' and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --派出所流动人口与出租屋协管员数
                   SELECT COUNT(1) INTO V_PCSZFBZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4
                         AND F.FJLB='1' and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';


                   --派出所巡防队员数
                   SELECT COUNT(1) INTO V_PCSXFDYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4
                         AND F.FJLB='2' and F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';


                   --社区警务室配备辅警数
                   SELECT COUNT(1) INTO V_SQJWSFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.ZXBS <> '1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --警务室数
                   SELECT COUNT(1) INTO V_SQJWSS
                   FROM T_COMMON_ORGANIZATION_SJJS S
                   WHERE LEVE=5  AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --建社区警务室数
                   SELECT COUNT(1) INTO V_JSQJWSS
                   FROM T_COMMON_ORGANIZATION_SJJS S INNER JOIN T_COMMON_ORGANIZATION_OTHER OT ON S.ORGCODE=OT.ORGCODE
                   WHERE S.LEVE=5  AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%' AND OT.SFJLJWS='1';

                   --社区民警数
                   SELECT COUNT(1) INTO V_SQMJS
                   FROM V_COMMON_USER U
                         INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
                   WHERE U.ISVALID='1'
                          AND O.ORGCODE IN (
                              SELECT ORGCODE FROM T_COMMON_ORGANIZATION_SJJS S
                              WHERE S.LEVE=5
                                    AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%'
                          );

                   --农村警务室数量
                   SELECT COUNT(1) INTO V_NCJWSS
                   FROM V_COMMON_ORGANIZATION O
                       LEFT JOIN T_COMMON_ORGANIZATION_OTHER T ON O.ORGCODE=T.ORGCODE
                   WHERE O.LEVE=5 AND T.SFNCJWS='1'
                        AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --省厅批准数
                   SELECT COUNT(1) INTO V_STPZS
                   FROM V_COMMON_ORGANIZATION O
                       LEFT JOIN T_COMMON_ORGANIZATION_OTHER T ON O.ORGCODE=T.ORGCODE
                   WHERE O.LEVE=4 AND T.SFSTPZ='1'
                        AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --驻村民警数
                   SELECT COUNT(1) INTO V_ZCMJS
                   FROM T_COMMON_USER_LXFS L
                        INNER JOIN V_COMMON_USER U ON L.USERID=U.USERID
                        INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
                   WHERE L.SFZCMJ='1' AND U.ISVALID='1'
                         AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                   --社区警务室接入公安内网数
                   SELECT COUNT(1) INTO V_JWSLGANWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';


                  --社区(驻村)警务室配备政法编制辅警数
                  SELECT COUNT(1) INTO V_SQJWSPBZFBZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.FJLB='3'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                  --社区(驻村)警务室配备巡防队员数
                   SELECT COUNT(1) INTO V_SQJWSPBXFDYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.FJLB='2'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                  --社区(驻村)警务室配备流动人口与出租屋协管员数
                   SELECT COUNT(1) INTO V_SQJWSPBLKXGYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 AND F.FJLB='1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';

                  
                  --社区警务室联网数
                   SELECT COUNT(1) INTO V_SQJWSLWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1' AND SFNCJWS='0'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                  --农村警务室联网数
                   SELECT COUNT(1) INTO V_NCJWSLWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1' AND SFNCJWS='1'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                        
                   INSERT INTO T_COMMON_PCSJBQKTJB
                    (ID, ORGCODE, ORGNAME, LEVE,PARENTCODE, ZJLS, PCSZS,
                         PCSJLS, PCSZFJS, SQJWSFJS, SQJWSS, SQMJS, NCJWSS, ZCMJS,
                         JWSLGANWS,STPZS,PCSZFBZFJS,PCSLDRKXGYS,PCSXFDYS,SQJWSPBZFBZFJS,
                         SQJWSPBXFDYS,SQJWSPBLKXGYS,JSQJWSS,SQJWSLWS,NCJWSLWS)
                   VALUES
                    (I, LIST(I).ORGCODE, LIST(I).ORGNAME, LIST(I).LEVE,LIST(I).PARENT_CODE, V_ZJLS, V_PCSZS,
                        V_PCSJLS, V_PCSZFJS, V_SQJWSFJS, V_SQJWSS, V_SQMJS, V_NCJWSS, V_ZCMJS,
                        V_JWSLGANWS,V_STPZS,V_PCSZFBZFJS,V_PCSLDRKXGYS,V_PCSXFDYS,V_SQJWSPBZFBZFJS,
                        V_SQJWSPBXFDYS,V_SQJWSPBLKXGYS,V_JSQJWSS,V_SQJWSLWS,V_NCJWSLWS);
                   COMMIT;
               EXCEPTION WHEN OTHERS THEN
                         V_ERROR:=SQLERRM;
               END;
             END LOOP;
       END LOOP;
END;
/

CREATE OR REPLACE FUNCTION F_GET_ORGMJS(V_ORGCODE VARCHAR2)
RETURN NUMBER
--获取单位下的总警力数，递归查找
AS
    V_ZJLS        NUMBER;--获取总警力数
    V_LEVE        NUMBER;
BEGIN
       --派出所级别
       SELECT F_GET_DWLEVE(V_ORGCODE) INTO V_LEVE FROM DUAL;
       SELECT COUNT(1) INTO V_ZJLS
       FROM V_COMMON_USER U
            INNER JOIN V_COMMON_ORGUSER OU ON OU.USERID=U.USERID
            INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID
       WHERE U.ISVALID='1'
             AND O.ORGCODE LIKE SUBSTR(V_ORGCODE,1,2*V_LEVE)||'%'
             AND ISVALID='1'
             AND O.ORGCODE NOT IN (
                 SELECT ORGCODE
                  FROM V_COMMON_ORGANIZATION
                  WHERE INSTR(UPPER(ORGCODE),'G') > 0 OR INSTR(UPPER(ORGCODE),'S') > 0
             );
       RETURN  V_ZJLS;
END;
/