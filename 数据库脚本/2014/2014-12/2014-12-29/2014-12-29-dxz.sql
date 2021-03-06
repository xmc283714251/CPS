
delete t_common_dictionary where zdlb ='ZDY_WXPDWFL' and dm = '3';
update t_common_dictionary set mc='腐蚀品' where zdlb ='ZDY_HWLB'  and dm = '1';
update t_common_dictionary set mc='易制爆危险物品' where zdlb ='ZDY_HWLB'  and dm = '2';
update t_common_dictionary set mc='剧毒化学品' where zdlb ='ZDY_HWLB'  and dm = '3';
update t_common_dictionary set mc='放射性物品' where zdlb ='ZDY_HWLB'  and dm = '4';
update t_common_dictionary set mc='爆炸物品' where zdlb ='ZDY_HWLB'  and dm = '5';
update t_common_dictionary set mc='枪支、子弹' where zdlb ='ZDY_HWLB'  and dm = '6';
update t_common_dictionary set mc='管制器具' where zdlb ='ZDY_HWLB'  and dm = '7';
commit;



CREATE OR REPLACE VIEW V_ZA_DWJC AS
SELECT jc.jlbh,
	   dw.jgbh,
	   dw.dwmc,
	   jc.jcryxm,
	   jc.jcsj,
	   dw.hylb,
	   '' AS dwfl,
	   dw.sfnbgl,
	   dw.sfzagl
  FROM t_za_dw_aqjcxx jc, t_za_jg_jbxx dw
 WHERE jc.jgbh = dw.jgbh
	  --不是内保单位
   AND NOT EXISTS
 (SELECT 1
		  FROM t_za_dwhc dwhc,
			   (SELECT jgbh, MAX(hcsj) AS hcsj FROM t_za_dwhc GROUP BY jgbh) dwhc2
		 WHERE dwhc.jgbh = dwhc2.jgbh
		   AND dwhc.hcsj = dwhc2.hcsj
		   AND dwhc.nbhc = '1'
		   AND dw.jgbh = dwhc.jgbh)
	  --不是危爆单位
	  --and not exists()
   AND dw.zxbs = '0'
UNION
--危爆物品
--枪支检查
SELECT to_char(qzjc.id) AS jlbh,
	   dw.jgbh,
	   dw.dwmc,
	   qzjc.jcrxm AS jcryxm,
	   to_char(qzjc.jcrq, 'yyyy-mm-dd') AS jcsj,
	   dw.hylb,
	   wxwpdw.dwfl,
	   dw.sfnbgl,
	   dw.sfzagl
  FROM t_za_wbdw_qzjc qzjc, t_za_dw_wxwpdw wxwpdw, t_za_jg_jbxx dw
 WHERE qzjc.jgbh = dw.jgbh
   AND wxwpdw.jgbh = dw.jgbh
   AND dw.zxbs = '0'
UNION
--剧毒化学品检查
SELECT to_char(jc.id) AS jlbh,
	   dw.jgbh,
	   dw.dwmc,
	   jc.djrxm AS jcryxm,
	   to_char(jc.djsj, 'yyyy-mm-dd') AS jcsj,
	   dw.hylb,
	   wxwpdw.dwfl,
	   dw.sfnbgl,
	   dw.sfzagl
  FROM t_za_wbdw_jdhx jc, t_za_dw_wxwpdw wxwpdw, t_za_jg_jbxx dw
 WHERE jc.jgbh = dw.jgbh
   AND wxwpdw.jgbh = dw.jgbh
   AND dw.zxbs = '0'
UNION
--危险易爆品检查
SELECT to_char(jc.id) AS jlbh,
	   dw.jgbh,
	   dw.dwmc,
	   jc.djrxm AS jcryxm,
	   to_char(jc.djsj, 'yyyy-mm-dd') AS jcsj,
	   dw.hylb,
	   wxwpdw.dwfl,
	   dw.sfnbgl,
	   dw.sfzagl
  FROM t_za_wbdw_wxhx jc, t_za_dw_wxwpdw wxwpdw, t_za_jg_jbxx dw
 WHERE jc.jgbh = dw.jgbh
   AND wxwpdw.jgbh = dw.jgbh
   AND dw.zxbs = '0'
UNION
--内保单位检查
SELECT jc.id AS jlbh,
	   dw.jgbh,
	   dw.dwmc,
	   jc.jcmjxm AS jcryxm,
	   to_char(jc.jcrq, 'yyyy-mm-dd') AS jcsj,
	   dw.hylb,
	   dwhc.dwfl,
	   dw.sfnbgl,
	   dw.sfzagl
  FROM t_za_nb_dwjc jc,
	   t_za_jg_jbxx dw,
	   (SELECT dwhc.*
		  FROM t_za_dwhc dwhc,
			   (SELECT jgbh, MAX(hcsj) AS hcsj FROM t_za_dwhc GROUP BY jgbh) dwhc2
		 WHERE dwhc.jgbh = dwhc2.jgbh
		   AND dwhc.hcsj = dwhc2.hcsj
		   AND dwhc.nbhc = '1') dwhc
 WHERE dw.jgbh = dwhc.jgbh
   AND dw.sfnbgl = '1'
   AND dw.zxbs = '0'
   AND jc.jgbh = dw.jgbh;
