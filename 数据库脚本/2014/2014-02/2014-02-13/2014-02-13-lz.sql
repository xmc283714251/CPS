CREATE OR REPLACE VIEW V_LSGL_RK_WLHCZHK AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      TO_CHAR(CSRQ,'YYYY-MM-DD') AS CSRQ,
      B.BMCH,
      B.BYZK,
      B.YWM,
      B.WHCD,
      B.ZJZL,
      B.ZJHM,
      B.ZZMM,
      B.HYZK,
      B.SG,
      B.XX,
      B.ZZXY,
      B.ZC,
      B.LXDH,
      B.FWCS,
      B.ZYDM,
      B.ZW,
      B.SF,
      B.JG,
      B.RYSX,
      '3' as rylb,
      C.WLHRKBH,
      C.CZJZL,
      C.CZJHM,
      C.WLHYY,
      TO_CHAR(C.WLHQSSJ,'YYYY-MM-DD') AS WLHQSSJ,
      C.YHJDQH,
      C.YHJDXZ,
      C.CSDXZ,
      C.BZ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.Rkfwglid,
      C.SSGAJGJGDM,
      C.SSGAJGJGMC,
      C.SSPCSDM,
      C.SSPCSMC,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ desc) AS RN
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_WLHCZHK C ON B.RYBH = C.RYBH;




-- Add/modify columns 
alter table T_LSGL_RK_LDRKZZXX add sfzhbx varchar2(5);
alter table T_LSGL_RK_LDRKZZXX add sfjkzm varchar2(5);
alter table T_LSGL_RK_LDRKZZXX add sfjhsy varchar2(5);
alter table T_LSGL_RK_LDRKZZXX add bmzw varchar2(50);
-- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.sfzhbx
  is '是否综合保险';
comment on column T_LSGL_RK_LDRKZZXX.sfjkzm
  is '是否有健康保险';
comment on column T_LSGL_RK_LDRKZZXX.sfjhsy
  is '是否计划生育';
comment on column T_LSGL_RK_LDRKZZXX.bmzw
  is '部门职务';
  
  
  
 CREATE OR REPLACE VIEW V_LSGL_RK_LDRK AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      B.CSRQ,
      B.BMCH,
      B.BYZK,
      B.YWM,
      B.WHCD,
      B.ZJZL,
      B.ZJHM,
      B.ZZMM,
      B.HYZK,
      B.SG,
      B.XX,
      B.ZZXY,
      B.ZC,
      B.LXDH,
      B.FWCS,
      B.ZYDM,
      B.ZW,
      B.SF,
      B.JG,
      B.RYSX,
      '2' as RYLB,
      B.HJDQH,
      B.HJDXZ,
      C.ZZBH,
      C.ZZZBH,
      C.HH,
      C.FZSFZH,
      C.FZXM,
      C.YHZGX,
      TO_CHAR(C.LBDRQ,'YYYY-MM-DD') AS LBDRQ,
      TO_CHAR(C.ZZZQFRQ,'YYYY-MM-DD') AS ZZZQFRQ,
      TO_CHAR(C.ZZZYXQJZRQ,'YYYY-MM-DD') AS ZZZYXQJZRQ,
      C.XFWCS,
      C.ZZSY,
      C.ZZDQH,
      C.ZZDXZ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.XCSZY,
      C.SSGAJGJGDM,
      C.SSGAJGJGMC,
      C.SSPCSDM,
      C.SSPCSMC,
      C.ZZCS,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.ZAGLZRRXM,
      C.ZAGLZRRSFZH,
      C.GZGX,
      C.FHBH,
      C.BZ,
      C.HDQK,
      C.HJDLX,
      C.NJZQX,
      c.bmzw,
      c.sfzhbx,
      c.sfjkzm,
      c.sfjhsy,
      TO_CHAR(C.NJZRQ,'YYYY-MM-DD') AS NJZRQ,
      C.RKFWGLID,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ DESC) AS RN
FROM V_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_LDRKZZXX C ON B.RYBH = C.RYBH;



 