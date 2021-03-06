-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add dzid varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add dzmc varchar2(200);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.dzid
  is '地址ID';
comment on column T_COMMON_ORGANIZATION_OTHER.dzmc
  is '警务室地址';
  
  
  
  
  
  create or replace view v_za_ry_cyry as
select
    cyry.cyrybh,
    cyry.rybh,
    cyry.jgbh,
    cyry.bmmc,
    cyry.gzly,
    cyry.pynx,
    cyry.zw as zwlb,
    cyry.sjhm,
    cyry.qtlxdh,
    cyry.zsqk,
    cyry.pxzh,
    cyry.pxzs,
    cyry.zdfwdxlb,
    cyry.bwcs,
    cyry.kzcs,
    cyry.zygx,
    cyry.zywt,
    cyry.jcqk,
    cyry.bz,
    cyry.zxyy,
    cyry.zxbs,
    to_char(cyry.zxrq,'yyyy-mm-dd') AS zxrq,
    cyry.czrxm,
    cyry.czdwdm,
    to_char(cyry.czsj,'yyyy-mm-dd HH24:mi:ss') as czsj,
    cyry.czbs,
    cyry.djdwdm,
    cyry.djdwmc,
    cyry.djrxm,
    to_char(cyry.djsj,'yyyy-mm-dd HH24:mi:ss') as djsj,
    cyry.czdwmc,
    to_char(cyry.lzsj,'yyyy-mm-dd') as lzsj,
    to_char(cyry.rzsj,'yyyy-mm-dd') as rzsj,
    cyry.cyryygh,
    cyry.xzdz,
    cyry.xm,
    cyry.xb,
    cyry.sfzh,
    cyry.csrq,
    cyry.mz,
    cyry.bmch,
    cyry.sfabry,
    cyry.rkfwglid,
    cyry.pfsj,
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc,
    (select hylb from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as hylb,
    cyry.djrjh,
    cyry.czrjh,
    cyry.XZDJWQ,
    (select orgname from v_common_organization where orgcode=cyry.XZDJWQ and rownum=1) as xzdjwqmc,
    cyry.FKRXM,
    cyry.FKDWDM,
    cyry.FKDWMC,
    cyry.FKSJ,
    cyry.FKNR,
    cyry.jzdpcsdm,
    cyry.jzdpcsmc,
    cyry.sfjwry,
    rkjbxx.xzzzrq,
    rkjbxx.lxdh,
    rkjbxx.xzzxz,
    rkjbxx.sspcsdm,
    cyry.jzdsqdm,
    cyry.jzdsqmc,
    nvl(rkjbxx.zjzl,'111') as zjzl,
    nvl(rkjbxx.sfzh,rkjbxx.zjhm) as zjhm
from t_za_ry_cyry cyry,t_lsgl_rk_jbxx rkjbxx where cyry.rybh = rkjbxx.rybh;
  