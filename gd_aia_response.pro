;; Calculate the AIA temperature response functions.


;f_abund = 'sun_coronal_2012_schmelz.abund' ;; aia_resp.sav
;;f_abund = 'sun_coronal_1992_feldman.abund' ;; aia_resp1.sav
;;f_abund = 'sun_coronal_1999_fludra_ext.abund' ;; aia_resp2.sav
;;f_abund = 'sun_coronal_1992_feldman_ext.abund' ;; aia_resp3.sav
f_abund = 'sun_photospheric_2009_asplund.abund'  ;; aia_resp4.sav

;pres = 1.e15 ;; aia_resp.sav
;dens = 1.e8 ;; density in cm^-3

;tic
;AIA_RESP = ch_aia_resp('20110919', density=dens, $
;                         abund_name = !xuvtop + '/abundance/' + f_abund, $
;                         ioneq_name = !xuvtop + '/ioneq/chianti.ioneq')
;toc

;save, AIA_RESP, filename='aia_resp4.sav'

logne = indgen(20)*0.5 + 5.0
dens = 10.^logne

aia_resp_all = []
for i=0,n_elements(dens)-1 do begin
   AIA_RESP = ch_aia_resp('20110919', density=dens[i], $
                         abund_name = !xuvtop + '/abundance/' + f_abund, $
                         ioneq_name = !xuvtop + '/ioneq/chianti.ioneq')
   aia_resp_all = [aia_resp_all, AIA_RESP]
endfor

aia_resp_grid = CREATE_STRUCT('dens', dens, 'aia_resp_all', aia_resp_all)
   
save, aia_resp_grid, filename='aia_resp_grid.sav'
   
end
