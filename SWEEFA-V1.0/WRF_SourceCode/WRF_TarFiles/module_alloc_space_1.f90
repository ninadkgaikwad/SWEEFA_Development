/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
MODULE module_alloc_space_1
CONTAINS
   SUBROUTINE alloc_space_field_core_1 ( grid, id, setinitval_in , tl_in , inter_domain_in , num_bytes_allocated , &
                                  sd31, ed31, sd32, ed32, sd33, ed33, &
                                  sm31 , em31 , sm32 , em32 , sm33 , em33 , &
                                  sp31 , ep31 , sp32 , ep32 , sp33 , ep33 , &
                                  sp31x, ep31x, sp32x, ep32x, sp33x, ep33x, &
                                  sp31y, ep31y, sp32y, ep32y, sp33y, ep33y, &
                                  sm31x, em31x, sm32x, em32x, sm33x, em33x, &
                                  sm31y, em31y, sm32y, em32y, sm33y, em33y )
      USE module_domain_type
      USE module_configure, ONLY : model_config_rec, grid_config_rec_type, in_use_for_config, model_to_grid_config_rec
      USE module_scalar_tables
      IMPLICIT NONE
      TYPE(domain) , POINTER :: grid
      INTEGER , INTENT(IN) :: id
      INTEGER , INTENT(IN) :: setinitval_in
      INTEGER , INTENT(IN) :: sd31, ed31, sd32, ed32, sd33, ed33
      INTEGER , INTENT(IN) :: sm31, em31, sm32, em32, sm33, em33
      INTEGER , INTENT(IN) :: sp31, ep31, sp32, ep32, sp33, ep33
      INTEGER , INTENT(IN) :: sp31x, ep31x, sp32x, ep32x, sp33x, ep33x
      INTEGER , INTENT(IN) :: sp31y, ep31y, sp32y, ep32y, sp33y, ep33y
      INTEGER , INTENT(IN) :: sm31x, em31x, sm32x, em32x, sm33x, em33x
      INTEGER , INTENT(IN) :: sm31y, em31y, sm32y, em32y, sm33y, em33y
      INTEGER , INTENT(IN) :: tl_in
      LOGICAL , INTENT(IN) :: inter_domain_in
      INTEGER , INTENT(INOUT) :: num_bytes_allocated
      INTEGER idum1, idum2, spec_bdy_width
      REAL initial_data_value
      CHARACTER (LEN=256) message
      INTEGER tl
      LOGICAL inter_domain
      INTEGER setinitval
      INTEGER sr_x, sr_y
      INTEGER ierr
      INTEGER :: loop
      TYPE ( grid_config_rec_type ) :: config_flags
      INTEGER :: k_start , k_end, its, ite, jts, jte
      INTEGER :: ids , ide , jds , jde , kds , kde , &
                                         ims , ime , jms , jme , kms , kme , &
                                         ips , ipe , jps , jpe , kps , kpe
      INTEGER :: sids , side , sjds , sjde , skds , skde , &
                                         sims , sime , sjms , sjme , skms , skme , &
                                         sips , sipe , sjps , sjpe , skps , skpe
      INTEGER :: imsx, imex, jmsx, jmex, kmsx, kmex, &
                              ipsx, ipex, jpsx, jpex, kpsx, kpex, &
                              imsy, imey, jmsy, jmey, kmsy, kmey, &
                              ipsy, ipey, jpsy, jpey, kpsy, kpey
      data_ordering : SELECT CASE ( model_data_order )
         CASE ( DATA_ORDER_XYZ )
             ids = sd31 ; ide = ed31 ; jds = sd32 ; jde = ed32 ; kds = sd33 ; kde = ed33 ;
             ims = sm31 ; ime = em31 ; jms = sm32 ; jme = em32 ; kms = sm33 ; kme = em33 ;
             ips = sp31 ; ipe = ep31 ; jps = sp32 ; jpe = ep32 ; kps = sp33 ; kpe = ep33 ;
             imsx = sm31x ; imex = em31x ; jmsx = sm32x ; jmex = em32x ; kmsx = sm33x ; kmex = em33x ;
             ipsx = sp31x ; ipex = ep31x ; jpsx = sp32x ; jpex = ep32x ; kpsx = sp33x ; kpex = ep33x ;
             imsy = sm31y ; imey = em31y ; jmsy = sm32y ; jmey = em32y ; kmsy = sm33y ; kmey = em33y ;
             ipsy = sp31y ; ipey = ep31y ; jpsy = sp32y ; jpey = ep32y ; kpsy = sp33y ; kpey = ep33y ;
         CASE ( DATA_ORDER_YXZ )
             ids = sd32 ; ide = ed32 ; jds = sd31 ; jde = ed31 ; kds = sd33 ; kde = ed33 ;
             ims = sm32 ; ime = em32 ; jms = sm31 ; jme = em31 ; kms = sm33 ; kme = em33 ;
             ips = sp32 ; ipe = ep32 ; jps = sp31 ; jpe = ep31 ; kps = sp33 ; kpe = ep33 ;
             imsx = sm32x ; imex = em32x ; jmsx = sm31x ; jmex = em31x ; kmsx = sm33x ; kmex = em33x ;
             ipsx = sp32x ; ipex = ep32x ; jpsx = sp31x ; jpex = ep31x ; kpsx = sp33x ; kpex = ep33x ;
             imsy = sm32y ; imey = em32y ; jmsy = sm31y ; jmey = em31y ; kmsy = sm33y ; kmey = em33y ;
             ipsy = sp32y ; ipey = ep32y ; jpsy = sp31y ; jpey = ep31y ; kpsy = sp33y ; kpey = ep33y ;
         CASE ( DATA_ORDER_ZXY )
             ids = sd32 ; ide = ed32 ; jds = sd33 ; jde = ed33 ; kds = sd31 ; kde = ed31 ;
             ims = sm32 ; ime = em32 ; jms = sm33 ; jme = em33 ; kms = sm31 ; kme = em31 ;
             ips = sp32 ; ipe = ep32 ; jps = sp33 ; jpe = ep33 ; kps = sp31 ; kpe = ep31 ;
             imsx = sm32x ; imex = em32x ; jmsx = sm33x ; jmex = em33x ; kmsx = sm31x ; kmex = em31x ;
             ipsx = sp32x ; ipex = ep32x ; jpsx = sp33x ; jpex = ep33x ; kpsx = sp31x ; kpex = ep31x ;
             imsy = sm32y ; imey = em32y ; jmsy = sm33y ; jmey = em33y ; kmsy = sm31y ; kmey = em31y ;
             ipsy = sp32y ; ipey = ep32y ; jpsy = sp33y ; jpey = ep33y ; kpsy = sp31y ; kpey = ep31y ;
         CASE ( DATA_ORDER_ZYX )
             ids = sd33 ; ide = ed33 ; jds = sd32 ; jde = ed32 ; kds = sd31 ; kde = ed31 ;
             ims = sm33 ; ime = em33 ; jms = sm32 ; jme = em32 ; kms = sm31 ; kme = em31 ;
             ips = sp33 ; ipe = ep33 ; jps = sp32 ; jpe = ep32 ; kps = sp31 ; kpe = ep31 ;
             imsx = sm33x ; imex = em33x ; jmsx = sm32x ; jmex = em32x ; kmsx = sm31x ; kmex = em31x ;
             ipsx = sp33x ; ipex = ep33x ; jpsx = sp32x ; jpex = ep32x ; kpsx = sp31x ; kpex = ep31x ;
             imsy = sm33y ; imey = em33y ; jmsy = sm32y ; jmey = em32y ; kmsy = sm31y ; kmey = em31y ;
             ipsy = sp33y ; ipey = ep33y ; jpsy = sp32y ; jpey = ep32y ; kpsy = sp31y ; kpey = ep31y ;
         CASE ( DATA_ORDER_XZY )
             ids = sd31 ; ide = ed31 ; jds = sd33 ; jde = ed33 ; kds = sd32 ; kde = ed32 ;
             ims = sm31 ; ime = em31 ; jms = sm33 ; jme = em33 ; kms = sm32 ; kme = em32 ;
             ips = sp31 ; ipe = ep31 ; jps = sp33 ; jpe = ep33 ; kps = sp32 ; kpe = ep32 ;
             imsx = sm31x ; imex = em31x ; jmsx = sm33x ; jmex = em33x ; kmsx = sm32x ; kmex = em32x ;
             ipsx = sp31x ; ipex = ep31x ; jpsx = sp33x ; jpex = ep33x ; kpsx = sp32x ; kpex = ep32x ;
             imsy = sm31y ; imey = em31y ; jmsy = sm33y ; jmey = em33y ; kmsy = sm32y ; kmey = em32y ;
             ipsy = sp31y ; ipey = ep31y ; jpsy = sp33y ; jpey = ep33y ; kpsy = sp32y ; kpey = ep32y ;
         CASE ( DATA_ORDER_YZX )
             ids = sd33 ; ide = ed33 ; jds = sd31 ; jde = ed31 ; kds = sd32 ; kde = ed32 ;
             ims = sm33 ; ime = em33 ; jms = sm31 ; jme = em31 ; kms = sm32 ; kme = em32 ;
             ips = sp33 ; ipe = ep33 ; jps = sp31 ; jpe = ep31 ; kps = sp32 ; kpe = ep32 ;
             imsx = sm33x ; imex = em33x ; jmsx = sm31x ; jmex = em31x ; kmsx = sm32x ; kmex = em32x ;
             ipsx = sp33x ; ipex = ep33x ; jpsx = sp31x ; jpex = ep31x ; kpsx = sp32x ; kpex = ep32x ;
             imsy = sm33y ; imey = em33y ; jmsy = sm31y ; jmey = em31y ; kmsy = sm32y ; kmey = em32y ;
             ipsy = sp33y ; ipey = ep33y ; jpsy = sp31y ; jpey = ep31y ; kpsy = sp32y ; kpey = ep32y ;
      END SELECT data_ordering
      CALL model_to_grid_config_rec ( id , model_config_rec , config_flags )
      CALL nl_get_sr_x( id , sr_x )
      CALL nl_get_sr_x( id , sr_y )
      tl = tl_in
      inter_domain = inter_domain_in
      CALL get_initial_data_value ( initial_data_value )
      setinitval = setinitval_in
      CALL nl_get_spec_bdy_width( 1, spec_bdy_width )
IF(in_use_for_config(id,'sst'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sst(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",204,&
    'frame/module_domain.f: Failed to allocate grid%sst(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sst=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sst'
  grid%tail_statevars%DataName = 'SST'
  grid%tail_statevars%Description = 'SEA SURFACE TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%sst
  grid%tail_statevars%streams(1) = 771751937
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%sst(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",252,&
    'frame/module_domain.f: Failed to allocate grid%sst(1,1).  ')
  endif
ENDIF
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'ifndsnowh'
   grid%tail_statevars%DataName = 'FNDSNOWH'
   grid%tail_statevars%Description = 'SNOWH_LOGICAL'
   grid%tail_statevars%Units = '-'
   grid%tail_statevars%Type = 'i'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .FALSE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%ifield_0d => grid%ifndsnowh
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 0
  ENDIF
IF ( setinitval .EQ. 3 ) grid%ifndsnowh=0
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'ifndsoilw'
   grid%tail_statevars%DataName = 'FNDSOILW'
   grid%tail_statevars%Description = 'SOILW_LOGICAL'
   grid%tail_statevars%Units = '-'
   grid%tail_statevars%Type = 'i'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .FALSE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%ifield_0d => grid%ifndsoilw
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 0
  ENDIF
IF ( setinitval .EQ. 3 ) grid%ifndsoilw=0
IF(in_use_for_config(id,'sstsk'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sstsk(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",299,&
    'frame/module_domain.f: Failed to allocate grid%sstsk(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sstsk=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sstsk'
  grid%tail_statevars%DataName = 'SSTSK'
  grid%tail_statevars%Description = 'SKIN SEA SURFACE TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%sstsk
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%sstsk(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",347,&
    'frame/module_domain.f: Failed to allocate grid%sstsk(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dtw').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dtw(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",356,&
    'frame/module_domain.f: Failed to allocate grid%dtw(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dtw=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dtw'
  grid%tail_statevars%DataName = 'DTW'
  grid%tail_statevars%Description = 'WARM LAYER TEMP DIFF'
  grid%tail_statevars%Units = 'C'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dtw
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dtw(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",404,&
    'frame/module_domain.f: Failed to allocate grid%dtw(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'hcoeff').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((model_config_rec%dfi_time_dim)-(1)+1))) * 4
  ALLOCATE(grid%hcoeff(1:model_config_rec%dfi_time_dim),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",413,&
    'frame/module_domain.f: Failed to allocate grid%hcoeff(1:model_config_rec%dfi_time_dim). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%hcoeff=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'hcoeff'
  grid%tail_statevars%DataName = 'HCOEFF'
  grid%tail_statevars%Description = 'initialization weights'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'C'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%hcoeff
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = 1
  grid%tail_statevars%ed1 = config_flags%dfi_time_dim
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = 1
  grid%tail_statevars%em1 = config_flags%dfi_time_dim
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = 1
  grid%tail_statevars%ep1 = config_flags%dfi_time_dim
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = ''
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%hcoeff(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",461,&
    'frame/module_domain.f: Failed to allocate grid%hcoeff(1).  ')
  endif
ENDIF
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'hcoeff_tot'
   grid%tail_statevars%DataName = 'HCOEFF_TOT'
   grid%tail_statevars%Description = 'initialization weights'
   grid%tail_statevars%Units = '-'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .FALSE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%hcoeff_tot
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  ENDIF
IF ( setinitval .EQ. 3 ) grid%hcoeff_tot=initial_data_value
IF(in_use_for_config(id,'dfi_p').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_p(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",489,&
    'frame/module_domain.f: Failed to allocate grid%dfi_p(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_p=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_p'
  grid%tail_statevars%DataName = 'P_DFI'
  grid%tail_statevars%Description = 'perturbation pressure'
  grid%tail_statevars%Units = 'Pa'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_p
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_p(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",537,&
    'frame/module_domain.f: Failed to allocate grid%dfi_p(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_al').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_al(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",546,&
    'frame/module_domain.f: Failed to allocate grid%dfi_al(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_al=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_al'
  grid%tail_statevars%DataName = 'AL_DFI'
  grid%tail_statevars%Description = 'inverse perturbation density'
  grid%tail_statevars%Units = 'm3 kg-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_al
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_al(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",594,&
    'frame/module_domain.f: Failed to allocate grid%dfi_al(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_mu').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_mu(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",603,&
    'frame/module_domain.f: Failed to allocate grid%dfi_mu(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_mu=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_mu'
  grid%tail_statevars%DataName = 'MU_DFI'
  grid%tail_statevars%Description = 'perturbation dry air mass in column'
  grid%tail_statevars%Units = 'Pa'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dfi_mu
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dfi_mu(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",651,&
    'frame/module_domain.f: Failed to allocate grid%dfi_mu(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_phb').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_phb(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",660,&
    'frame/module_domain.f: Failed to allocate grid%dfi_phb(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_phb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_phb'
  grid%tail_statevars%DataName = 'PHB_DFI'
  grid%tail_statevars%Description = 'base-state geopotential'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_phb
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_phb(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",708,&
    'frame/module_domain.f: Failed to allocate grid%dfi_phb(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_ph0').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_ph0(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",717,&
    'frame/module_domain.f: Failed to allocate grid%dfi_ph0(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_ph0=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_ph0'
  grid%tail_statevars%DataName = 'PH0_DFI'
  grid%tail_statevars%Description = 'initial geopotential'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_ph0
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_ph0(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",765,&
    'frame/module_domain.f: Failed to allocate grid%dfi_ph0(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_php').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_php(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",774,&
    'frame/module_domain.f: Failed to allocate grid%dfi_php(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_php=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_php'
  grid%tail_statevars%DataName = 'PHP_DFI'
  grid%tail_statevars%Description = 'geopotential'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_php
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_php(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",822,&
    'frame/module_domain.f: Failed to allocate grid%dfi_php(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_u').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_u(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",831,&
    'frame/module_domain.f: Failed to allocate grid%dfi_u(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_u=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_u'
  grid%tail_statevars%DataName = 'U_DFI'
  grid%tail_statevars%Description = 'u accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_u
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_u(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",879,&
    'frame/module_domain.f: Failed to allocate grid%dfi_u(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_v').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_v(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",888,&
    'frame/module_domain.f: Failed to allocate grid%dfi_v(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_v=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_v'
  grid%tail_statevars%DataName = 'V_DFI'
  grid%tail_statevars%Description = 'v accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_v
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_v(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",936,&
    'frame/module_domain.f: Failed to allocate grid%dfi_v(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_w').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_w(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",945,&
    'frame/module_domain.f: Failed to allocate grid%dfi_w(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_w=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_w'
  grid%tail_statevars%DataName = 'W_DFI'
  grid%tail_statevars%Description = 'w accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_w
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_w(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",993,&
    'frame/module_domain.f: Failed to allocate grid%dfi_w(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_ww').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_ww(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1002,&
    'frame/module_domain.f: Failed to allocate grid%dfi_ww(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_ww=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_ww'
  grid%tail_statevars%DataName = 'WW_DFI'
  grid%tail_statevars%Description = 'mu-coupled eta-dot'
  grid%tail_statevars%Units = 'Pa s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_ww
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_ww(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1050,&
    'frame/module_domain.f: Failed to allocate grid%dfi_ww(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_t').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_t(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1059,&
    'frame/module_domain.f: Failed to allocate grid%dfi_t(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_t=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_t'
  grid%tail_statevars%DataName = 'TT_DFI'
  grid%tail_statevars%Description = 't accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_t
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_t(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1107,&
    'frame/module_domain.f: Failed to allocate grid%dfi_t(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_rh').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_rh(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1116,&
    'frame/module_domain.f: Failed to allocate grid%dfi_rh(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_rh=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_rh'
  grid%tail_statevars%DataName = 'RH_DFI'
  grid%tail_statevars%Description = 'initial relative humidity'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_rh
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_rh(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1164,&
    'frame/module_domain.f: Failed to allocate grid%dfi_rh(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_ph').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_ph(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1173,&
    'frame/module_domain.f: Failed to allocate grid%dfi_ph(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_ph=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_ph'
  grid%tail_statevars%DataName = 'PH_DFI'
  grid%tail_statevars%Description = 'p accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_ph
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_ph(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1221,&
    'frame/module_domain.f: Failed to allocate grid%dfi_ph(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_pb').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_pb(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1230,&
    'frame/module_domain.f: Failed to allocate grid%dfi_pb(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_pb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_pb'
  grid%tail_statevars%DataName = 'PB_DFI'
  grid%tail_statevars%Description = 'pb accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_pb
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_pb(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1278,&
    'frame/module_domain.f: Failed to allocate grid%dfi_pb(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_alt').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_alt(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1287,&
    'frame/module_domain.f: Failed to allocate grid%dfi_alt(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_alt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_alt'
  grid%tail_statevars%DataName = 'ALT_DFI'
  grid%tail_statevars%Description = '1/rho accumulation array'
  grid%tail_statevars%Units = '   '
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_alt
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_alt(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1335,&
    'frame/module_domain.f: Failed to allocate grid%dfi_alt(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_tke').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_tke(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1344,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tke(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_tke=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_tke'
  grid%tail_statevars%DataName = 'TKE_DFI'
  grid%tail_statevars%Description = 'TURBULENCE KINETIC ENERGY'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_tke
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_tke(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1392,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tke(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_tten_rad').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_tten_rad(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1401,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tten_rad(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_tten_rad=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_tten_rad'
  grid%tail_statevars%DataName = 'RAD_TTEN_DFI'
  grid%tail_statevars%Description = 'RADAR POT. TEMP. TENDENCY'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_tten_rad
  grid%tail_statevars%streams(1) = 33554433
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_tten_rad(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1449,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tten_rad(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_tslb').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_tslb(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1458,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tslb(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_tslb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_tslb'
  grid%tail_statevars%DataName = 'TSLB_DFI'
  grid%tail_statevars%Description = 'SOIL TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_tslb
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_tslb(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1506,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tslb(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_smois').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_smois(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1515,&
    'frame/module_domain.f: Failed to allocate grid%dfi_smois(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_smois=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_smois'
  grid%tail_statevars%DataName = 'SMOIS_DFI'
  grid%tail_statevars%Description = 'SOIL MOISTURE'
  grid%tail_statevars%Units = 'm3 m-3'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_smois
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_smois(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1563,&
    'frame/module_domain.f: Failed to allocate grid%dfi_smois(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_snow').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_snow(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1572,&
    'frame/module_domain.f: Failed to allocate grid%dfi_snow(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_snow=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_snow'
  grid%tail_statevars%DataName = 'SNOW_DFI'
  grid%tail_statevars%Description = 'SNOW WATER EQUIVALENT'
  grid%tail_statevars%Units = 'kg m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dfi_snow
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dfi_snow(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1620,&
    'frame/module_domain.f: Failed to allocate grid%dfi_snow(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_snowh').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_snowh(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1629,&
    'frame/module_domain.f: Failed to allocate grid%dfi_snowh(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_snowh=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_snowh'
  grid%tail_statevars%DataName = 'SNOWH_DFI'
  grid%tail_statevars%Description = 'PHYSICAL SNOW DEPTH'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dfi_snowh
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dfi_snowh(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1677,&
    'frame/module_domain.f: Failed to allocate grid%dfi_snowh(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_canwat').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_canwat(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1686,&
    'frame/module_domain.f: Failed to allocate grid%dfi_canwat(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_canwat=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_canwat'
  grid%tail_statevars%DataName = 'CANWAT_DFI'
  grid%tail_statevars%Description = 'CANOPY WATER'
  grid%tail_statevars%Units = 'kg m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dfi_canwat
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dfi_canwat(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1734,&
    'frame/module_domain.f: Failed to allocate grid%dfi_canwat(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_smfr3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_smfr3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1743,&
    'frame/module_domain.f: Failed to allocate grid%dfi_smfr3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_smfr3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_smfr3d'
  grid%tail_statevars%DataName = 'SMFR3D_DFI'
  grid%tail_statevars%Description = 'SOIL ICE'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_smfr3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_smfr3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1791,&
    'frame/module_domain.f: Failed to allocate grid%dfi_smfr3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_keepfr3dflag').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_keepfr3dflag(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1800,&
    'frame/module_domain.f: Failed to allocate grid%dfi_keepfr3dflag(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_keepfr3dflag=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_keepfr3dflag'
  grid%tail_statevars%DataName = 'KEEPFR3DFLAG_DFI'
  grid%tail_statevars%Description = 'FLAG - 1. FROZEN SOIL YES, 0 - NO'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dfi_keepfr3dflag
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dfi_keepfr3dflag(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1848,&
    'frame/module_domain.f: Failed to allocate grid%dfi_keepfr3dflag(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tr_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tr_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1857,&
    'frame/module_domain.f: Failed to allocate grid%tr_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tr_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tr_urb2d'
  grid%tail_statevars%DataName = 'TR_URB'
  grid%tail_statevars%Description = 'URBAN ROOF SKIN TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tr_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tr_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1905,&
    'frame/module_domain.f: Failed to allocate grid%tr_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tb_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tb_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1914,&
    'frame/module_domain.f: Failed to allocate grid%tb_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tb_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tb_urb2d'
  grid%tail_statevars%DataName = 'TB_URB'
  grid%tail_statevars%Description = 'URBAN WALL SKIN TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tb_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tb_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1962,&
    'frame/module_domain.f: Failed to allocate grid%tb_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tg_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tg_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",1971,&
    'frame/module_domain.f: Failed to allocate grid%tg_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tg_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tg_urb2d'
  grid%tail_statevars%DataName = 'TG_URB'
  grid%tail_statevars%Description = 'URBAN ROAD SKIN TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tg_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tg_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2019,&
    'frame/module_domain.f: Failed to allocate grid%tg_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tc_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tc_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2028,&
    'frame/module_domain.f: Failed to allocate grid%tc_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tc_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tc_urb2d'
  grid%tail_statevars%DataName = 'TC_URB'
  grid%tail_statevars%Description = 'URBAN CANOPY TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tc_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tc_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2076,&
    'frame/module_domain.f: Failed to allocate grid%tc_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qc_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qc_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2085,&
    'frame/module_domain.f: Failed to allocate grid%qc_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qc_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qc_urb2d'
  grid%tail_statevars%DataName = 'QC_URB'
  grid%tail_statevars%Description = 'URBAN CANOPY HUMIDITY'
  grid%tail_statevars%Units = 'kg kg{-1}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%qc_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%qc_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2133,&
    'frame/module_domain.f: Failed to allocate grid%qc_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'uc_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%uc_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2142,&
    'frame/module_domain.f: Failed to allocate grid%uc_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%uc_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'uc_urb2d'
  grid%tail_statevars%DataName = 'UC_URB'
  grid%tail_statevars%Description = 'URBAN CANOPY WIND'
  grid%tail_statevars%Units = 'm s{-1}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%uc_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%uc_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2190,&
    'frame/module_domain.f: Failed to allocate grid%uc_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xxxr_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xxxr_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2199,&
    'frame/module_domain.f: Failed to allocate grid%xxxr_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xxxr_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xxxr_urb2d'
  grid%tail_statevars%DataName = 'XXXR_URB'
  grid%tail_statevars%Description = 'M-O LENGTH ABOVE URBAN ROOF'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xxxr_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xxxr_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2247,&
    'frame/module_domain.f: Failed to allocate grid%xxxr_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xxxb_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xxxb_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2256,&
    'frame/module_domain.f: Failed to allocate grid%xxxb_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xxxb_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xxxb_urb2d'
  grid%tail_statevars%DataName = 'XXXB_URB'
  grid%tail_statevars%Description = 'M-O LENGTH ABOVE URBAN WALL'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xxxb_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xxxb_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2304,&
    'frame/module_domain.f: Failed to allocate grid%xxxb_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xxxg_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xxxg_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2313,&
    'frame/module_domain.f: Failed to allocate grid%xxxg_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xxxg_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xxxg_urb2d'
  grid%tail_statevars%DataName = 'XXXG_URB'
  grid%tail_statevars%Description = 'M-O LENGTH ABOVE URBAN ROAD'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xxxg_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xxxg_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2361,&
    'frame/module_domain.f: Failed to allocate grid%xxxg_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xxxc_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xxxc_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2370,&
    'frame/module_domain.f: Failed to allocate grid%xxxc_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xxxc_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xxxc_urb2d'
  grid%tail_statevars%DataName = 'XXXC_URB'
  grid%tail_statevars%Description = 'M-O LENGTH ABOVE URBAN CANOPY'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xxxc_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xxxc_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2418,&
    'frame/module_domain.f: Failed to allocate grid%xxxc_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'trl_urb3d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%trl_urb3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2427,&
    'frame/module_domain.f: Failed to allocate grid%trl_urb3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%trl_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'trl_urb3d'
  grid%tail_statevars%DataName = 'TRL_URB'
  grid%tail_statevars%Description = 'ROOF LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%trl_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%trl_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2475,&
    'frame/module_domain.f: Failed to allocate grid%trl_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tbl_urb3d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tbl_urb3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2484,&
    'frame/module_domain.f: Failed to allocate grid%tbl_urb3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tbl_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tbl_urb3d'
  grid%tail_statevars%DataName = 'TBL_URB'
  grid%tail_statevars%Description = 'WALL LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tbl_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tbl_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2532,&
    'frame/module_domain.f: Failed to allocate grid%tbl_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tgl_urb3d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tgl_urb3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2541,&
    'frame/module_domain.f: Failed to allocate grid%tgl_urb3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tgl_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tgl_urb3d'
  grid%tail_statevars%DataName = 'TGL_URB'
  grid%tail_statevars%Description = 'ROAD LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tgl_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tgl_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2589,&
    'frame/module_domain.f: Failed to allocate grid%tgl_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sh_urb2d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sh_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2598,&
    'frame/module_domain.f: Failed to allocate grid%sh_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sh_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sh_urb2d'
  grid%tail_statevars%DataName = 'SH_URB'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%sh_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%sh_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2646,&
    'frame/module_domain.f: Failed to allocate grid%sh_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lh_urb2d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lh_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2655,&
    'frame/module_domain.f: Failed to allocate grid%lh_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lh_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lh_urb2d'
  grid%tail_statevars%DataName = 'LH_URB'
  grid%tail_statevars%Description = 'LATENT HEAT FLUX FROM URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lh_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lh_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2703,&
    'frame/module_domain.f: Failed to allocate grid%lh_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'g_urb2d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%g_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2712,&
    'frame/module_domain.f: Failed to allocate grid%g_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%g_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'g_urb2d'
  grid%tail_statevars%DataName = 'G_URB'
  grid%tail_statevars%Description = 'GROUND HEAT FLUX INTO URBAN'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%g_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%g_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2760,&
    'frame/module_domain.f: Failed to allocate grid%g_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rn_urb2d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rn_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2769,&
    'frame/module_domain.f: Failed to allocate grid%rn_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rn_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rn_urb2d'
  grid%tail_statevars%DataName = 'RN_URB'
  grid%tail_statevars%Description = 'NET RADIATION ON URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rn_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rn_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2817,&
    'frame/module_domain.f: Failed to allocate grid%rn_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ts_urb2d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ts_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2826,&
    'frame/module_domain.f: Failed to allocate grid%ts_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ts_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ts_urb2d'
  grid%tail_statevars%DataName = 'TS_URB'
  grid%tail_statevars%Description = 'SKIN TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ts_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ts_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2874,&
    'frame/module_domain.f: Failed to allocate grid%ts_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'frc_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%frc_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2883,&
    'frame/module_domain.f: Failed to allocate grid%frc_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%frc_urb2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'frc_urb2d'
  grid%tail_statevars%DataName = 'FRC_URB'
  grid%tail_statevars%Description = 'URBAN FRACTION'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%frc_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%frc_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2931,&
    'frame/module_domain.f: Failed to allocate grid%frc_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'utype_urb2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%utype_urb2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2940,&
    'frame/module_domain.f: Failed to allocate grid%utype_urb2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%utype_urb2d=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'utype_urb2d'
  grid%tail_statevars%DataName = 'UTYPE_URB'
  grid%tail_statevars%Description = 'URBAN TYPE'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%utype_urb2d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%utype_urb2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2988,&
    'frame/module_domain.f: Failed to allocate grid%utype_urb2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'trb_urb4d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%trb_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",2997,&
    'frame/module_domain.f: Failed to allocate grid%trb_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%trb_urb4d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'trb_urb4d'
  grid%tail_statevars%DataName = 'TRB_URB4D'
  grid%tail_statevars%Description = 'ROOF LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%trb_urb4d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%trb_urb4d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3045,&
    'frame/module_domain.f: Failed to allocate grid%trb_urb4d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tw1_urb4d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tw1_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3054,&
    'frame/module_domain.f: Failed to allocate grid%tw1_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tw1_urb4d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tw1_urb4d'
  grid%tail_statevars%DataName = 'TW1_URB4D'
  grid%tail_statevars%Description = 'WALL LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tw1_urb4d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tw1_urb4d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3102,&
    'frame/module_domain.f: Failed to allocate grid%tw1_urb4d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tw2_urb4d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tw2_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3111,&
    'frame/module_domain.f: Failed to allocate grid%tw2_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tw2_urb4d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tw2_urb4d'
  grid%tail_statevars%DataName = 'TW2_URB4D'
  grid%tail_statevars%Description = 'WALL LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tw2_urb4d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tw2_urb4d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3159,&
    'frame/module_domain.f: Failed to allocate grid%tw2_urb4d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tgb_urb4d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tgb_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3168,&
    'frame/module_domain.f: Failed to allocate grid%tgb_urb4d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tgb_urb4d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tgb_urb4d'
  grid%tail_statevars%DataName = 'TGB_URB4D'
  grid%tail_statevars%Description = 'ROAD LAYER TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tgb_urb4d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tgb_urb4d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3216,&
    'frame/module_domain.f: Failed to allocate grid%tgb_urb4d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tlev_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tlev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3225,&
    'frame/module_domain.f: Failed to allocate grid%tlev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tlev_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tlev_urb3d'
  grid%tail_statevars%DataName = 'TLEV_URB3D'
  grid%tail_statevars%Description = 'INDOOR TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tlev_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tlev_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3273,&
    'frame/module_domain.f: Failed to allocate grid%tlev_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qlev_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qlev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3282,&
    'frame/module_domain.f: Failed to allocate grid%qlev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qlev_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qlev_urb3d'
  grid%tail_statevars%DataName = 'QLEV_URB3D'
  grid%tail_statevars%Description = 'SPECIFIC HUMIDITY'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%qlev_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%qlev_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3330,&
    'frame/module_domain.f: Failed to allocate grid%qlev_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tw1lev_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tw1lev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3339,&
    'frame/module_domain.f: Failed to allocate grid%tw1lev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tw1lev_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tw1lev_urb3d'
  grid%tail_statevars%DataName = 'TW1LEV_URB3D'
  grid%tail_statevars%Description = 'WINDOW TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tw1lev_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tw1lev_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3387,&
    'frame/module_domain.f: Failed to allocate grid%tw1lev_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tw2lev_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tw2lev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3396,&
    'frame/module_domain.f: Failed to allocate grid%tw2lev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tw2lev_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tw2lev_urb3d'
  grid%tail_statevars%DataName = 'TW2LEV_URB3D'
  grid%tail_statevars%Description = 'WINDOW TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tw2lev_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tw2lev_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3444,&
    'frame/module_domain.f: Failed to allocate grid%tw2lev_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tglev_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tglev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3453,&
    'frame/module_domain.f: Failed to allocate grid%tglev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tglev_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tglev_urb3d'
  grid%tail_statevars%DataName = 'TGLEV_URB3D'
  grid%tail_statevars%Description = 'GROUND TEMPERATURE BELOW A BUILDING'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tglev_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tglev_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3501,&
    'frame/module_domain.f: Failed to allocate grid%tglev_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tflev_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tflev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3510,&
    'frame/module_domain.f: Failed to allocate grid%tflev_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tflev_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tflev_urb3d'
  grid%tail_statevars%DataName = 'TFLEV_URB3D'
  grid%tail_statevars%Description = 'FLOOR TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tflev_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tflev_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3558,&
    'frame/module_domain.f: Failed to allocate grid%tflev_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sf_ac_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sf_ac_urb3d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3567,&
    'frame/module_domain.f: Failed to allocate grid%sf_ac_urb3d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sf_ac_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sf_ac_urb3d'
  grid%tail_statevars%DataName = 'SF_AC_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM THE AIR COND.'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%sf_ac_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%sf_ac_urb3d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3615,&
    'frame/module_domain.f: Failed to allocate grid%sf_ac_urb3d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lf_ac_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lf_ac_urb3d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3624,&
    'frame/module_domain.f: Failed to allocate grid%lf_ac_urb3d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lf_ac_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lf_ac_urb3d'
  grid%tail_statevars%DataName = 'LF_AC_URB3D'
  grid%tail_statevars%Description = 'LATENT HEAT FLUX FROM THE AIR COND.'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lf_ac_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lf_ac_urb3d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3672,&
    'frame/module_domain.f: Failed to allocate grid%lf_ac_urb3d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cm_ac_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cm_ac_urb3d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3681,&
    'frame/module_domain.f: Failed to allocate grid%cm_ac_urb3d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cm_ac_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cm_ac_urb3d'
  grid%tail_statevars%DataName = 'CM_AC_URB3D'
  grid%tail_statevars%Description = 'CONSUMPTION OF THE AIR COND.'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cm_ac_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cm_ac_urb3d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3729,&
    'frame/module_domain.f: Failed to allocate grid%cm_ac_urb3d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfvent_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfvent_urb3d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3738,&
    'frame/module_domain.f: Failed to allocate grid%sfvent_urb3d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfvent_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfvent_urb3d'
  grid%tail_statevars%DataName = 'SFVENT_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN VENTILATION'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%sfvent_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%sfvent_urb3d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3786,&
    'frame/module_domain.f: Failed to allocate grid%sfvent_urb3d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lfvent_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lfvent_urb3d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3795,&
    'frame/module_domain.f: Failed to allocate grid%lfvent_urb3d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lfvent_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lfvent_urb3d'
  grid%tail_statevars%DataName = 'LFVENT_URB3D'
  grid%tail_statevars%Description = 'LATENT HEAT FLUX FROM URBAN VENTILATION'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lfvent_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lfvent_urb3d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3843,&
    'frame/module_domain.f: Failed to allocate grid%lfvent_urb3d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfwin1_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfwin1_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3852,&
    'frame/module_domain.f: Failed to allocate grid%sfwin1_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfwin1_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfwin1_urb3d'
  grid%tail_statevars%DataName = 'SFWIN1_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC WINDOW'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sfwin1_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sfwin1_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3900,&
    'frame/module_domain.f: Failed to allocate grid%sfwin1_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfwin2_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfwin2_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3909,&
    'frame/module_domain.f: Failed to allocate grid%sfwin2_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfwin2_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfwin2_urb3d'
  grid%tail_statevars%DataName = 'SFWIN2_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC WINDOW'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sfwin2_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sfwin2_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3957,&
    'frame/module_domain.f: Failed to allocate grid%sfwin2_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfw1_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfw1_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",3966,&
    'frame/module_domain.f: Failed to allocate grid%sfw1_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfw1_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfw1_urb3d'
  grid%tail_statevars%DataName = 'SFW1_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sfw1_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sfw1_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4014,&
    'frame/module_domain.f: Failed to allocate grid%sfw1_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfw2_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfw2_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4023,&
    'frame/module_domain.f: Failed to allocate grid%sfw2_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfw2_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfw2_urb3d'
  grid%tail_statevars%DataName = 'SFW2_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sfw2_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sfw2_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4071,&
    'frame/module_domain.f: Failed to allocate grid%sfw2_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfr_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfr_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4080,&
    'frame/module_domain.f: Failed to allocate grid%sfr_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfr_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfr_urb3d'
  grid%tail_statevars%DataName = 'SFR_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sfr_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sfr_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4128,&
    'frame/module_domain.f: Failed to allocate grid%sfr_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sfg_urb3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_urban_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sfg_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4137,&
    'frame/module_domain.f: Failed to allocate grid%sfg_urb3d(sm31:em31,1:model_config_rec%num_urban_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sfg_urb3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sfg_urb3d'
  grid%tail_statevars%DataName = 'SFG_URB3D'
  grid%tail_statevars%Description = 'SENSIBLE HEAT FLUX FROM URBAN SFC'
  grid%tail_statevars%Units = 'W m{-2}'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sfg_urb3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_urban_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_urban_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_urban_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'urban_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sfg_urb3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4185,&
    'frame/module_domain.f: Failed to allocate grid%sfg_urb3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cmr_sfcdif').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cmr_sfcdif(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4194,&
    'frame/module_domain.f: Failed to allocate grid%cmr_sfcdif(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cmr_sfcdif=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cmr_sfcdif'
  grid%tail_statevars%DataName = 'CMR_SFCDIF'
  grid%tail_statevars%Description = ''
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cmr_sfcdif
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cmr_sfcdif(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4242,&
    'frame/module_domain.f: Failed to allocate grid%cmr_sfcdif(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'chr_sfcdif').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%chr_sfcdif(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4251,&
    'frame/module_domain.f: Failed to allocate grid%chr_sfcdif(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%chr_sfcdif=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'chr_sfcdif'
  grid%tail_statevars%DataName = 'CHR_SFCDIF'
  grid%tail_statevars%Description = ''
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%chr_sfcdif
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%chr_sfcdif(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4299,&
    'frame/module_domain.f: Failed to allocate grid%chr_sfcdif(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cmc_sfcdif').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cmc_sfcdif(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4308,&
    'frame/module_domain.f: Failed to allocate grid%cmc_sfcdif(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cmc_sfcdif=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cmc_sfcdif'
  grid%tail_statevars%DataName = 'CMC_SFCDIF'
  grid%tail_statevars%Description = ''
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cmc_sfcdif
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cmc_sfcdif(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4356,&
    'frame/module_domain.f: Failed to allocate grid%cmc_sfcdif(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'chc_sfcdif').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%chc_sfcdif(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4365,&
    'frame/module_domain.f: Failed to allocate grid%chc_sfcdif(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%chc_sfcdif=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'chc_sfcdif'
  grid%tail_statevars%DataName = 'CHC_SFCDIF'
  grid%tail_statevars%Description = ''
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%chc_sfcdif
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%chc_sfcdif(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4413,&
    'frame/module_domain.f: Failed to allocate grid%chc_sfcdif(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'coszen').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%coszen(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4422,&
    'frame/module_domain.f: Failed to allocate grid%coszen(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%coszen=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'coszen'
  grid%tail_statevars%DataName = 'COSZEN'
  grid%tail_statevars%Description = 'COS of SOLAR ZENITH ANGLE'
  grid%tail_statevars%Units = 'dimensionless'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%coszen
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%coszen(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4470,&
    'frame/module_domain.f: Failed to allocate grid%coszen(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'hrang').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%hrang(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4479,&
    'frame/module_domain.f: Failed to allocate grid%hrang(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%hrang=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'hrang'
  grid%tail_statevars%DataName = 'HRANG'
  grid%tail_statevars%Description = 'SOLAR HOUR ANGLE'
  grid%tail_statevars%Units = 'radians'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%hrang
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%hrang(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4527,&
    'frame/module_domain.f: Failed to allocate grid%hrang(1,1).  ')
  endif
ENDIF
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'declin'
   grid%tail_statevars%DataName = 'DECLIN'
   grid%tail_statevars%Description = 'SOLAR DECLINATION'
   grid%tail_statevars%Units = 'radians'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%declin
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%declin=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'solcon'
   grid%tail_statevars%DataName = 'SOLCON'
   grid%tail_statevars%Description = 'SOLAR CONSTANT'
   grid%tail_statevars%Units = 'W m-2'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%solcon
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%solcon=initial_data_value
IF(in_use_for_config(id,'smfr3d').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%smfr3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4574,&
    'frame/module_domain.f: Failed to allocate grid%smfr3d(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%smfr3d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'smfr3d'
  grid%tail_statevars%DataName = 'SMFR3D'
  grid%tail_statevars%Description = 'SOIL ICE'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%smfr3d
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%smfr3d(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4622,&
    'frame/module_domain.f: Failed to allocate grid%smfr3d(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'keepfr3dflag').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%num_soil_layers)-(1)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%keepfr3dflag(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4631,&
    'frame/module_domain.f: Failed to allocate grid%keepfr3dflag(sm31:em31,1:model_config_rec%num_soil_layers,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%keepfr3dflag=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'keepfr3dflag'
  grid%tail_statevars%DataName = 'KEEPFR3DFLAG'
  grid%tail_statevars%Description = 'FLAG - 1. FROZEN SOIL YES, 0 - NO'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%keepfr3dflag
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%num_soil_layers
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%num_soil_layers
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%num_soil_layers
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'soil_layers_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%keepfr3dflag(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4679,&
    'frame/module_domain.f: Failed to allocate grid%keepfr3dflag(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ra').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ra(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4688,&
    'frame/module_domain.f: Failed to allocate grid%ra(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ra=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ra'
  grid%tail_statevars%DataName = 'RA'
  grid%tail_statevars%Description = 'AERODYNAMIC RESISTANCE'
  grid%tail_statevars%Units = 's m-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ra
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ra(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4736,&
    'frame/module_domain.f: Failed to allocate grid%ra(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rs').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rs(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4745,&
    'frame/module_domain.f: Failed to allocate grid%rs(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rs=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rs'
  grid%tail_statevars%DataName = 'RS'
  grid%tail_statevars%Description = 'SURFACE RESISTANCE'
  grid%tail_statevars%Units = 's m-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rs
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rs(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4793,&
    'frame/module_domain.f: Failed to allocate grid%rs(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lai').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lai(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4802,&
    'frame/module_domain.f: Failed to allocate grid%lai(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lai=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lai'
  grid%tail_statevars%DataName = 'LAI'
  grid%tail_statevars%Description = 'Leaf area index'
  grid%tail_statevars%Units = 'area/area'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lai
  grid%tail_statevars%streams(1) = 771751937
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lai(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4850,&
    'frame/module_domain.f: Failed to allocate grid%lai(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'vegf_px').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%vegf_px(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4859,&
    'frame/module_domain.f: Failed to allocate grid%vegf_px(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%vegf_px=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'vegf_px'
  grid%tail_statevars%DataName = 'VEGF_PX'
  grid%tail_statevars%Description = 'Vegetation Fraction for PX LSM'
  grid%tail_statevars%Units = 'area/area'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%vegf_px
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%vegf_px(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4907,&
    'frame/module_domain.f: Failed to allocate grid%vegf_px(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'t2obs').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%t2obs(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4916,&
    'frame/module_domain.f: Failed to allocate grid%t2obs(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%t2obs=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 't2obs'
  grid%tail_statevars%DataName = 'T2OBS'
  grid%tail_statevars%Description = '2-m temperature from analysis '
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%t2obs
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%t2obs(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4964,&
    'frame/module_domain.f: Failed to allocate grid%t2obs(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'q2obs').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%q2obs(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",4973,&
    'frame/module_domain.f: Failed to allocate grid%q2obs(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%q2obs=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'q2obs'
  grid%tail_statevars%DataName = 'Q2OBS'
  grid%tail_statevars%Description = '2-m mixing ratio from analysis '
  grid%tail_statevars%Units = 'kg/kg'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%q2obs
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%q2obs(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5021,&
    'frame/module_domain.f: Failed to allocate grid%q2obs(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tke_myj').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tke_myj(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5030,&
    'frame/module_domain.f: Failed to allocate grid%tke_myj(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tke_myj=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tke_myj'
  grid%tail_statevars%DataName = 'TKE_MYJ'
  grid%tail_statevars%Description = 'TKE FROM MELLOR-YAMADA-JANJIC'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tke_myj
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tke_myj(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5078,&
    'frame/module_domain.f: Failed to allocate grid%tke_myj(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'el_myj').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%el_myj(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5087,&
    'frame/module_domain.f: Failed to allocate grid%el_myj(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%el_myj=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'el_myj'
  grid%tail_statevars%DataName = 'EL_MYJ'
  grid%tail_statevars%Description = 'MIXING LENGTH FROM MELLOR-YAMADA-JANJIC'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%el_myj
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%el_myj(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5135,&
    'frame/module_domain.f: Failed to allocate grid%el_myj(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'exch_h').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%exch_h(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5144,&
    'frame/module_domain.f: Failed to allocate grid%exch_h(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%exch_h=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'exch_h'
  grid%tail_statevars%DataName = 'EXCH_H'
  grid%tail_statevars%Description = 'EXCHANGE COEFFICIENTS '
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%exch_h
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%exch_h(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5192,&
    'frame/module_domain.f: Failed to allocate grid%exch_h(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'exch_m').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%exch_m(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5201,&
    'frame/module_domain.f: Failed to allocate grid%exch_m(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%exch_m=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'exch_m'
  grid%tail_statevars%DataName = 'EXCH_M'
  grid%tail_statevars%Description = 'EXCHANGE COEFFICIENTS '
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%exch_m
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%exch_m(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5249,&
    'frame/module_domain.f: Failed to allocate grid%exch_m(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ct').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ct(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5258,&
    'frame/module_domain.f: Failed to allocate grid%ct(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ct=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ct'
  grid%tail_statevars%DataName = 'CT'
  grid%tail_statevars%Description = 'COUNTERGRADIENT TERM'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ct
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ct(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5306,&
    'frame/module_domain.f: Failed to allocate grid%ct(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'thz0').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%thz0(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5315,&
    'frame/module_domain.f: Failed to allocate grid%thz0(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%thz0=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'thz0'
  grid%tail_statevars%DataName = 'THZ0'
  grid%tail_statevars%Description = 'POTENTIAL TEMPERATURE AT ZNT'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%thz0
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%thz0(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5363,&
    'frame/module_domain.f: Failed to allocate grid%thz0(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'z0').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%z0(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5372,&
    'frame/module_domain.f: Failed to allocate grid%z0(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%z0=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'z0'
  grid%tail_statevars%DataName = 'Z0'
  grid%tail_statevars%Description = 'Background ROUGHNESS LENGTH'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%z0
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%z0(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5420,&
    'frame/module_domain.f: Failed to allocate grid%z0(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qz0').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qz0(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5429,&
    'frame/module_domain.f: Failed to allocate grid%qz0(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qz0=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qz0'
  grid%tail_statevars%DataName = 'QZ0'
  grid%tail_statevars%Description = 'SPECIFIC HUMIDITY AT ZNT'
  grid%tail_statevars%Units = 'kg kg-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%qz0
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%qz0(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5477,&
    'frame/module_domain.f: Failed to allocate grid%qz0(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'uz0').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%uz0(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5486,&
    'frame/module_domain.f: Failed to allocate grid%uz0(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%uz0=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'uz0'
  grid%tail_statevars%DataName = 'UZ0'
  grid%tail_statevars%Description = 'U WIND COMPONENT AT ZNT'
  grid%tail_statevars%Units = 'm s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%uz0
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%uz0(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5534,&
    'frame/module_domain.f: Failed to allocate grid%uz0(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'vz0').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%vz0(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5543,&
    'frame/module_domain.f: Failed to allocate grid%vz0(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%vz0=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'vz0'
  grid%tail_statevars%DataName = 'VZ0'
  grid%tail_statevars%Description = 'V WIND COMPONENT AT ZNT'
  grid%tail_statevars%Units = 'm s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%vz0
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%vz0(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5591,&
    'frame/module_domain.f: Failed to allocate grid%vz0(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qsfc').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qsfc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5600,&
    'frame/module_domain.f: Failed to allocate grid%qsfc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qsfc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qsfc'
  grid%tail_statevars%DataName = 'QSFC'
  grid%tail_statevars%Description = 'SPECIFIC HUMIDITY AT LOWER BOUNDARY'
  grid%tail_statevars%Units = 'kg kg-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%qsfc
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%qsfc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5648,&
    'frame/module_domain.f: Failed to allocate grid%qsfc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'akhs').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%akhs(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5657,&
    'frame/module_domain.f: Failed to allocate grid%akhs(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%akhs=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'akhs'
  grid%tail_statevars%DataName = 'AKHS'
  grid%tail_statevars%Description = 'SFC EXCH COEFF FOR HEAT'
  grid%tail_statevars%Units = 'm s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%akhs
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%akhs(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5705,&
    'frame/module_domain.f: Failed to allocate grid%akhs(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'akms').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%akms(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5714,&
    'frame/module_domain.f: Failed to allocate grid%akms(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%akms=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'akms'
  grid%tail_statevars%DataName = 'AKMS'
  grid%tail_statevars%Description = 'SFC EXCH COEFF FOR MOMENTUM'
  grid%tail_statevars%Units = 'm s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%akms
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%akms(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5762,&
    'frame/module_domain.f: Failed to allocate grid%akms(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'kpbl').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%kpbl(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5771,&
    'frame/module_domain.f: Failed to allocate grid%kpbl(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%kpbl=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'kpbl'
  grid%tail_statevars%DataName = 'KPBL'
  grid%tail_statevars%Description = 'LEVEL OF PBL TOP'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%kpbl
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%kpbl(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5819,&
    'frame/module_domain.f: Failed to allocate grid%kpbl(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tshltr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tshltr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5828,&
    'frame/module_domain.f: Failed to allocate grid%tshltr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tshltr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tshltr'
  grid%tail_statevars%DataName = 'TSHLTR'
  grid%tail_statevars%Description = 'SHELTER THETA FROM MYJ'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tshltr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tshltr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5876,&
    'frame/module_domain.f: Failed to allocate grid%tshltr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qshltr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qshltr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5885,&
    'frame/module_domain.f: Failed to allocate grid%qshltr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qshltr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qshltr'
  grid%tail_statevars%DataName = 'QSHLTR'
  grid%tail_statevars%Description = 'SHELTER SPECIFIC HUMIDITY FROM MYJ'
  grid%tail_statevars%Units = 'kg kg-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%qshltr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%qshltr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5933,&
    'frame/module_domain.f: Failed to allocate grid%qshltr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'pshltr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%pshltr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5942,&
    'frame/module_domain.f: Failed to allocate grid%pshltr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%pshltr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'pshltr'
  grid%tail_statevars%DataName = 'PSHLTR'
  grid%tail_statevars%Description = 'SHELTER PRESSURE FROM MYJ'
  grid%tail_statevars%Units = 'Pa'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%pshltr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%pshltr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5990,&
    'frame/module_domain.f: Failed to allocate grid%pshltr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'th10').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%th10(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",5999,&
    'frame/module_domain.f: Failed to allocate grid%th10(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%th10=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'th10'
  grid%tail_statevars%DataName = 'TH10'
  grid%tail_statevars%Description = '10-M THETA FROM MYJ'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%th10
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%th10(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6047,&
    'frame/module_domain.f: Failed to allocate grid%th10(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'q10').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%q10(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6056,&
    'frame/module_domain.f: Failed to allocate grid%q10(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%q10=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'q10'
  grid%tail_statevars%DataName = 'Q10'
  grid%tail_statevars%Description = '10-M SPECIFIC HUMIDITY FROM MYJ'
  grid%tail_statevars%Units = 'kg kg-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%q10
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%q10(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6104,&
    'frame/module_domain.f: Failed to allocate grid%q10(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qke').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qke(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6113,&
    'frame/module_domain.f: Failed to allocate grid%qke(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qke=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qke'
  grid%tail_statevars%DataName = 'QKE'
  grid%tail_statevars%Description = 'twice TKE FROM MYNN'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%qke
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%qke(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6161,&
    'frame/module_domain.f: Failed to allocate grid%qke(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tsq').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tsq(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6170,&
    'frame/module_domain.f: Failed to allocate grid%tsq(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tsq=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tsq'
  grid%tail_statevars%DataName = 'TSQ'
  grid%tail_statevars%Description = 'liquid water pottemp variance'
  grid%tail_statevars%Units = 'K2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tsq
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tsq(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6218,&
    'frame/module_domain.f: Failed to allocate grid%tsq(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qsq').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qsq(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6227,&
    'frame/module_domain.f: Failed to allocate grid%qsq(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qsq=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qsq'
  grid%tail_statevars%DataName = 'QSQ'
  grid%tail_statevars%Description = 'liquid water variance'
  grid%tail_statevars%Units = '(kg/kg)**2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%qsq
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%qsq(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6275,&
    'frame/module_domain.f: Failed to allocate grid%qsq(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cov').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cov(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6284,&
    'frame/module_domain.f: Failed to allocate grid%cov(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cov=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cov'
  grid%tail_statevars%DataName = 'COV'
  grid%tail_statevars%Description = 'liquid water-liquid water pottemp covariance'
  grid%tail_statevars%Units = 'K kg/kg'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cov
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cov(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6332,&
    'frame/module_domain.f: Failed to allocate grid%cov(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ch').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ch(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6341,&
    'frame/module_domain.f: Failed to allocate grid%ch(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ch=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ch'
  grid%tail_statevars%DataName = 'CH'
  grid%tail_statevars%Description = 'drag coeff for heat'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ch
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ch(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6389,&
    'frame/module_domain.f: Failed to allocate grid%ch(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dusfcg').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dusfcg(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6398,&
    'frame/module_domain.f: Failed to allocate grid%dusfcg(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dusfcg=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dusfcg'
  grid%tail_statevars%DataName = 'DUSFCG'
  grid%tail_statevars%Description = 'COLUMN U STRESS DIAGOSTIC'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dusfcg
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dusfcg(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6446,&
    'frame/module_domain.f: Failed to allocate grid%dusfcg(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dvsfcg').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dvsfcg(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6455,&
    'frame/module_domain.f: Failed to allocate grid%dvsfcg(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dvsfcg=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dvsfcg'
  grid%tail_statevars%DataName = 'DVSFCG'
  grid%tail_statevars%Description = 'COLUMN V STRESS DIAGOSTIC'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dvsfcg
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dvsfcg(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6503,&
    'frame/module_domain.f: Failed to allocate grid%dvsfcg(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'var2d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%var2d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6512,&
    'frame/module_domain.f: Failed to allocate grid%var2d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%var2d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'var2d'
  grid%tail_statevars%DataName = 'VAR'
  grid%tail_statevars%Description = 'OROGRAPHIC VARIANCE'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%var2d
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%var2d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6560,&
    'frame/module_domain.f: Failed to allocate grid%var2d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'oc12d'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%oc12d(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6569,&
    'frame/module_domain.f: Failed to allocate grid%oc12d(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%oc12d=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'oc12d'
  grid%tail_statevars%DataName = 'CON'
  grid%tail_statevars%Description = 'OROGRAPHIC CONVEXITY'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%oc12d
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%oc12d(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6617,&
    'frame/module_domain.f: Failed to allocate grid%oc12d(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'oa1'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%oa1(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6626,&
    'frame/module_domain.f: Failed to allocate grid%oa1(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%oa1=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'oa1'
  grid%tail_statevars%DataName = 'OA1'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%oa1
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%oa1(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6674,&
    'frame/module_domain.f: Failed to allocate grid%oa1(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'oa2'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%oa2(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6683,&
    'frame/module_domain.f: Failed to allocate grid%oa2(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%oa2=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'oa2'
  grid%tail_statevars%DataName = 'OA2'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%oa2
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%oa2(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6731,&
    'frame/module_domain.f: Failed to allocate grid%oa2(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'oa3'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%oa3(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6740,&
    'frame/module_domain.f: Failed to allocate grid%oa3(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%oa3=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'oa3'
  grid%tail_statevars%DataName = 'OA3'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%oa3
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%oa3(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6788,&
    'frame/module_domain.f: Failed to allocate grid%oa3(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'oa4'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%oa4(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6797,&
    'frame/module_domain.f: Failed to allocate grid%oa4(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%oa4=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'oa4'
  grid%tail_statevars%DataName = 'OA4'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%oa4
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%oa4(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6845,&
    'frame/module_domain.f: Failed to allocate grid%oa4(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ol1'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ol1(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6854,&
    'frame/module_domain.f: Failed to allocate grid%ol1(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ol1=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ol1'
  grid%tail_statevars%DataName = 'OL1'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ol1
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ol1(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6902,&
    'frame/module_domain.f: Failed to allocate grid%ol1(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ol2'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ol2(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6911,&
    'frame/module_domain.f: Failed to allocate grid%ol2(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ol2=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ol2'
  grid%tail_statevars%DataName = 'OL2'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ol2
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ol2(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6959,&
    'frame/module_domain.f: Failed to allocate grid%ol2(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ol3'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ol3(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",6968,&
    'frame/module_domain.f: Failed to allocate grid%ol3(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ol3=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ol3'
  grid%tail_statevars%DataName = 'OL3'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ol3
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ol3(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7016,&
    'frame/module_domain.f: Failed to allocate grid%ol3(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ol4'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ol4(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7025,&
    'frame/module_domain.f: Failed to allocate grid%ol4(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ol4=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ol4'
  grid%tail_statevars%DataName = 'OL4'
  grid%tail_statevars%Description = 'OROGRAPHIC DIRECTION ASYMMETRY FUNCTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ol4
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ol4(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7073,&
    'frame/module_domain.f: Failed to allocate grid%ol4(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'a_u_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%a_u_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7082,&
    'frame/module_domain.f: Failed to allocate grid%a_u_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%a_u_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'a_u_bep'
  grid%tail_statevars%DataName = 'A_U_BEP'
  grid%tail_statevars%Description = 'IMPLICIT FOR X-COMP.'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%a_u_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%a_u_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7130,&
    'frame/module_domain.f: Failed to allocate grid%a_u_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'a_v_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%a_v_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7139,&
    'frame/module_domain.f: Failed to allocate grid%a_v_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%a_v_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'a_v_bep'
  grid%tail_statevars%DataName = 'A_V_BEP'
  grid%tail_statevars%Description = 'IMPLICIT FOR Y-COMP.'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%a_v_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%a_v_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7187,&
    'frame/module_domain.f: Failed to allocate grid%a_v_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'a_t_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%a_t_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7196,&
    'frame/module_domain.f: Failed to allocate grid%a_t_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%a_t_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'a_t_bep'
  grid%tail_statevars%DataName = 'A_T_BEP'
  grid%tail_statevars%Description = 'IMPLICIT FOR Pot. Temp'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%a_t_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%a_t_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7244,&
    'frame/module_domain.f: Failed to allocate grid%a_t_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'a_q_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%a_q_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7253,&
    'frame/module_domain.f: Failed to allocate grid%a_q_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%a_q_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'a_q_bep'
  grid%tail_statevars%DataName = 'A_Q_BEP'
  grid%tail_statevars%Description = 'IMPLICIT FOR Moisture'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%a_q_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%a_q_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7301,&
    'frame/module_domain.f: Failed to allocate grid%a_q_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'a_e_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%a_e_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7310,&
    'frame/module_domain.f: Failed to allocate grid%a_e_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%a_e_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'a_e_bep'
  grid%tail_statevars%DataName = 'A_E_BEP'
  grid%tail_statevars%Description = 'IMPLICIT FOR TKE'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%a_e_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%a_e_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7358,&
    'frame/module_domain.f: Failed to allocate grid%a_e_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'b_u_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%b_u_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7367,&
    'frame/module_domain.f: Failed to allocate grid%b_u_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%b_u_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'b_u_bep'
  grid%tail_statevars%DataName = 'B_U_BEP'
  grid%tail_statevars%Description = 'EXPLICIT FOR X-COMP.'
  grid%tail_statevars%Units = 'm s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%b_u_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%b_u_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7415,&
    'frame/module_domain.f: Failed to allocate grid%b_u_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'b_v_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%b_v_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7424,&
    'frame/module_domain.f: Failed to allocate grid%b_v_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%b_v_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'b_v_bep'
  grid%tail_statevars%DataName = 'B_V_BEP'
  grid%tail_statevars%Description = 'EXPLICIT FOR Y-COMP.'
  grid%tail_statevars%Units = 'm s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%b_v_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%b_v_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7472,&
    'frame/module_domain.f: Failed to allocate grid%b_v_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'b_t_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%b_t_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7481,&
    'frame/module_domain.f: Failed to allocate grid%b_t_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%b_t_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'b_t_bep'
  grid%tail_statevars%DataName = 'B_T_BEP'
  grid%tail_statevars%Description = 'EXPLICIT FOR Pot. Temp'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%b_t_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%b_t_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7529,&
    'frame/module_domain.f: Failed to allocate grid%b_t_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'b_q_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%b_q_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7538,&
    'frame/module_domain.f: Failed to allocate grid%b_q_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%b_q_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'b_q_bep'
  grid%tail_statevars%DataName = 'B_Q_BEP'
  grid%tail_statevars%Description = 'EXPLICIT FOR Moisture'
  grid%tail_statevars%Units = 'kg s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%b_q_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%b_q_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7586,&
    'frame/module_domain.f: Failed to allocate grid%b_q_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'b_e_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%b_e_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7595,&
    'frame/module_domain.f: Failed to allocate grid%b_e_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%b_e_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'b_e_bep'
  grid%tail_statevars%DataName = 'B_E_BEP'
  grid%tail_statevars%Description = 'EXPLICIT FOR TKE'
  grid%tail_statevars%Units = 'm2 s-3'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%b_e_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%b_e_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7643,&
    'frame/module_domain.f: Failed to allocate grid%b_e_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dlg_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dlg_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7652,&
    'frame/module_domain.f: Failed to allocate grid%dlg_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dlg_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dlg_bep'
  grid%tail_statevars%DataName = 'DLG_BEP'
  grid%tail_statevars%Description = 'length scale 1'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dlg_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dlg_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7700,&
    'frame/module_domain.f: Failed to allocate grid%dlg_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dl_u_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dl_u_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7709,&
    'frame/module_domain.f: Failed to allocate grid%dl_u_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dl_u_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dl_u_bep'
  grid%tail_statevars%DataName = 'DL_U_BEP'
  grid%tail_statevars%Description = 'urban length scale'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%dl_u_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%dl_u_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7757,&
    'frame/module_domain.f: Failed to allocate grid%dl_u_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sf_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sf_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7766,&
    'frame/module_domain.f: Failed to allocate grid%sf_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sf_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sf_bep'
  grid%tail_statevars%DataName = 'SF_BEP'
  grid%tail_statevars%Description = 'surface grid'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%sf_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%sf_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7814,&
    'frame/module_domain.f: Failed to allocate grid%sf_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'vl_bep').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%vl_bep(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7823,&
    'frame/module_domain.f: Failed to allocate grid%vl_bep(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%vl_bep=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'vl_bep'
  grid%tail_statevars%DataName = 'VL_BEP'
  grid%tail_statevars%Description = 'volume grid'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%vl_bep
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = kde
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( kde, kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top_stag'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%vl_bep(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7871,&
    'frame/module_domain.f: Failed to allocate grid%vl_bep(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tke_pbl').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tke_pbl(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7880,&
    'frame/module_domain.f: Failed to allocate grid%tke_pbl(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tke_pbl=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tke_pbl'
  grid%tail_statevars%DataName = 'TKE_PBL'
  grid%tail_statevars%Description = 'TKE FROM Bougeault and Lacarrere'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%tke_pbl
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%tke_pbl(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7928,&
    'frame/module_domain.f: Failed to allocate grid%tke_pbl(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'el_pbl').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%el_pbl(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7937,&
    'frame/module_domain.f: Failed to allocate grid%el_pbl(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%el_pbl=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'el_pbl'
  grid%tail_statevars%DataName = 'EL_PBL'
  grid%tail_statevars%Description = 'Length scale FROM Bougeault and Lacarrere'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%el_pbl
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%el_pbl(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7985,&
    'frame/module_domain.f: Failed to allocate grid%el_pbl(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'wu_tur').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%wu_tur(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",7994,&
    'frame/module_domain.f: Failed to allocate grid%wu_tur(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%wu_tur=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'wu_tur'
  grid%tail_statevars%DataName = 'WU_TUR'
  grid%tail_statevars%Description = 'Turbulent flux of momentum(x)'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%wu_tur
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%wu_tur(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8042,&
    'frame/module_domain.f: Failed to allocate grid%wu_tur(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'wv_tur').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%wv_tur(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8051,&
    'frame/module_domain.f: Failed to allocate grid%wv_tur(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%wv_tur=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'wv_tur'
  grid%tail_statevars%DataName = 'WV_TUR'
  grid%tail_statevars%Description = 'Turbulent flux of momentum(y)'
  grid%tail_statevars%Units = 'm2 s-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%wv_tur
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%wv_tur(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8099,&
    'frame/module_domain.f: Failed to allocate grid%wv_tur(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'wt_tur').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%wt_tur(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8108,&
    'frame/module_domain.f: Failed to allocate grid%wt_tur(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%wt_tur=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'wt_tur'
  grid%tail_statevars%DataName = 'WT_TUR'
  grid%tail_statevars%Description = 'Turbulent flux of temperature'
  grid%tail_statevars%Units = 'K m s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%wt_tur
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%wt_tur(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8156,&
    'frame/module_domain.f: Failed to allocate grid%wt_tur(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'wq_tur').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%wq_tur(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8165,&
    'frame/module_domain.f: Failed to allocate grid%wq_tur(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%wq_tur=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'wq_tur'
  grid%tail_statevars%DataName = 'WQ_TUR'
  grid%tail_statevars%Description = 'Turbulent flux of water vapor'
  grid%tail_statevars%Units = '- m s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%wq_tur
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%wq_tur(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8213,&
    'frame/module_domain.f: Failed to allocate grid%wq_tur(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'htop').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%htop(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8222,&
    'frame/module_domain.f: Failed to allocate grid%htop(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%htop=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'htop'
  grid%tail_statevars%DataName = 'HTOP'
  grid%tail_statevars%Description = 'TOP OF CONVECTION LEVEL'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%htop
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%htop(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8270,&
    'frame/module_domain.f: Failed to allocate grid%htop(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'hbot').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%hbot(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8279,&
    'frame/module_domain.f: Failed to allocate grid%hbot(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%hbot=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'hbot'
  grid%tail_statevars%DataName = 'HBOT'
  grid%tail_statevars%Description = 'BOT OF CONVECTION LEVEL'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%hbot
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%hbot(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8327,&
    'frame/module_domain.f: Failed to allocate grid%hbot(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'htopr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%htopr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8336,&
    'frame/module_domain.f: Failed to allocate grid%htopr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%htopr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'htopr'
  grid%tail_statevars%DataName = 'HTOPR'
  grid%tail_statevars%Description = 'TOP OF CONVECTION LEVEL FOR RADIATION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%htopr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%htopr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8384,&
    'frame/module_domain.f: Failed to allocate grid%htopr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'hbotr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%hbotr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8393,&
    'frame/module_domain.f: Failed to allocate grid%hbotr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%hbotr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'hbotr'
  grid%tail_statevars%DataName = 'HBOTR'
  grid%tail_statevars%Description = 'BOT OF CONVECTION LEVEL FOR RADIATION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%hbotr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%hbotr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8441,&
    'frame/module_domain.f: Failed to allocate grid%hbotr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cutop').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cutop(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8450,&
    'frame/module_domain.f: Failed to allocate grid%cutop(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cutop=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cutop'
  grid%tail_statevars%DataName = 'CUTOP'
  grid%tail_statevars%Description = 'TOP OF CONVECTION LEVEL FROM CUMULUS PAR'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cutop
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cutop(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8498,&
    'frame/module_domain.f: Failed to allocate grid%cutop(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cubot').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cubot(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8507,&
    'frame/module_domain.f: Failed to allocate grid%cubot(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cubot=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cubot'
  grid%tail_statevars%DataName = 'CUBOT'
  grid%tail_statevars%Description = 'BOT OF CONVECTION LEVEL FROM CUMULUS PAR'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cubot
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cubot(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8555,&
    'frame/module_domain.f: Failed to allocate grid%cubot(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cuppt').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cuppt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8564,&
    'frame/module_domain.f: Failed to allocate grid%cuppt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cuppt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cuppt'
  grid%tail_statevars%DataName = 'CUPPT'
  grid%tail_statevars%Description = 'ACCUMULATED CONVECTIVE RAIN SINC LAST CALL TO THE RADIATION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cuppt
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cuppt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8612,&
    'frame/module_domain.f: Failed to allocate grid%cuppt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rswtoa').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rswtoa(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8621,&
    'frame/module_domain.f: Failed to allocate grid%rswtoa(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rswtoa=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rswtoa'
  grid%tail_statevars%DataName = 'RSWTOA'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rswtoa
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rswtoa(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8669,&
    'frame/module_domain.f: Failed to allocate grid%rswtoa(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rlwtoa').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rlwtoa(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8678,&
    'frame/module_domain.f: Failed to allocate grid%rlwtoa(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rlwtoa=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rlwtoa'
  grid%tail_statevars%DataName = 'RLWTOA'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rlwtoa
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rlwtoa(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8726,&
    'frame/module_domain.f: Failed to allocate grid%rlwtoa(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'czmean').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%czmean(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8735,&
    'frame/module_domain.f: Failed to allocate grid%czmean(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%czmean=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'czmean'
  grid%tail_statevars%DataName = 'CZMEAN'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%czmean
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%czmean(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8783,&
    'frame/module_domain.f: Failed to allocate grid%czmean(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cfracl').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cfracl(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8792,&
    'frame/module_domain.f: Failed to allocate grid%cfracl(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cfracl=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cfracl'
  grid%tail_statevars%DataName = 'CFRACL'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cfracl
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cfracl(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8840,&
    'frame/module_domain.f: Failed to allocate grid%cfracl(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cfracm').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cfracm(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8849,&
    'frame/module_domain.f: Failed to allocate grid%cfracm(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cfracm=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cfracm'
  grid%tail_statevars%DataName = 'CFRACM'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cfracm
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cfracm(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8897,&
    'frame/module_domain.f: Failed to allocate grid%cfracm(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cfrach').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cfrach(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8906,&
    'frame/module_domain.f: Failed to allocate grid%cfrach(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cfrach=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cfrach'
  grid%tail_statevars%DataName = 'CFRACH'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cfrach
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cfrach(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8954,&
    'frame/module_domain.f: Failed to allocate grid%cfrach(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acfrst').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acfrst(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",8963,&
    'frame/module_domain.f: Failed to allocate grid%acfrst(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acfrst=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acfrst'
  grid%tail_statevars%DataName = 'ACFRST'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acfrst
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acfrst(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9011,&
    'frame/module_domain.f: Failed to allocate grid%acfrst(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ncfrst').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ncfrst(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9020,&
    'frame/module_domain.f: Failed to allocate grid%ncfrst(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ncfrst=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ncfrst'
  grid%tail_statevars%DataName = 'NCFRST'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%ncfrst
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ncfrst(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9068,&
    'frame/module_domain.f: Failed to allocate grid%ncfrst(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acfrcv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acfrcv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9077,&
    'frame/module_domain.f: Failed to allocate grid%acfrcv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acfrcv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acfrcv'
  grid%tail_statevars%DataName = 'ACFRCV'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acfrcv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acfrcv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9125,&
    'frame/module_domain.f: Failed to allocate grid%acfrcv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ncfrcv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ncfrcv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9134,&
    'frame/module_domain.f: Failed to allocate grid%ncfrcv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ncfrcv=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ncfrcv'
  grid%tail_statevars%DataName = 'NCFRCV'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%ncfrcv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ncfrcv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9182,&
    'frame/module_domain.f: Failed to allocate grid%ncfrcv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ozmixm'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%levsiz)-(1)+1))*(((em33)-(sm33)+1)*num_ozmixm)) * 4
  ALLOCATE(grid%ozmixm(sm31:em31,1:model_config_rec%levsiz,sm33:em33,num_ozmixm),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9191,&
    'frame/module_domain.f: Failed to allocate grid%ozmixm(sm31:em31,1:model_config_rec%levsiz,sm33:em33,num_ozmixm). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ozmixm=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ozmixm'
  grid%tail_statevars%DataName = 'OZMIXM'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 4
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .TRUE.
  grid%tail_statevars%rfield_4d => grid%ozmixm
  grid%tail_statevars%num_table => ozmixm_num_table
  grid%tail_statevars%index_table => ozmixm_index_table
  grid%tail_statevars%boundary_table => ozmixm_boundary_table
  grid%tail_statevars%dname_table => ozmixm_dname_table
  grid%tail_statevars%desc_table => ozmixm_desc_table
  grid%tail_statevars%units_table => ozmixm_units_table
  grid%tail_statevars%streams_table => ozmixm_streams_table
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%levsiz
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%levsiz
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%levsiz
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'levsiz'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%ozmixm(1,1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9246,&
    'frame/module_domain.f: Failed to allocate grid%ozmixm(1,1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'pin').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((model_config_rec%levsiz)-(1)+1))) * 4
  ALLOCATE(grid%pin(1:model_config_rec%levsiz),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9255,&
    'frame/module_domain.f: Failed to allocate grid%pin(1:model_config_rec%levsiz). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%pin=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'pin'
  grid%tail_statevars%DataName = 'PIN'
  grid%tail_statevars%Description = 'PRESSURE LEVEL OF OZONE MIXING RATIO'
  grid%tail_statevars%Units = 'millibar'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'Z'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%pin
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = 1
  grid%tail_statevars%ed1 = config_flags%levsiz
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = 1
  grid%tail_statevars%em1 = config_flags%levsiz
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = 1
  grid%tail_statevars%ep1 = config_flags%levsiz
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'levsiz'
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%pin(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9303,&
    'frame/module_domain.f: Failed to allocate grid%pin(1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'m_ps_1').AND.(.NOT.grid%is_intermediate).AND.(IAND(1,tl).NE.0))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%m_ps_1(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9312,&
    'frame/module_domain.f: Failed to allocate grid%m_ps_1(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%m_ps_1=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'm_ps_1'
  grid%tail_statevars%DataName = 'M_PS_1'
  grid%tail_statevars%Description = 'PS from MATCH on WRF grids'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 201
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%m_ps_1
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%m_ps_1(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9360,&
    'frame/module_domain.f: Failed to allocate grid%m_ps_1(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'m_ps_2').AND.(.NOT.grid%is_intermediate).AND.(IAND(2,tl).NE.0))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%m_ps_2(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9369,&
    'frame/module_domain.f: Failed to allocate grid%m_ps_2(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%m_ps_2=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'm_ps_2'
  grid%tail_statevars%DataName = 'M_PS_2'
  grid%tail_statevars%Description = 'PS from MATCH on WRF grids'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 202
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%m_ps_2
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%m_ps_2(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9417,&
    'frame/module_domain.f: Failed to allocate grid%m_ps_2(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aerosolc_1').AND.(IAND(1,tl).NE.0))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%paerlev)-(1)+1))*(((em33)-(sm33)+1)*num_aerosolc)) * 4
  ALLOCATE(grid%aerosolc_1(sm31:em31,1:model_config_rec%paerlev,sm33:em33,num_aerosolc),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9426,&
    'frame/module_domain.f: Failed to allocate grid%aerosolc_1(sm31:em31,1:model_config_rec%paerlev,sm33:em33,num_aerosolc). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aerosolc_1=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aerosolc_1'
  grid%tail_statevars%DataName = 'AEROSOLC_1'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 201
  grid%tail_statevars%Ndim = 4
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .TRUE.
  grid%tail_statevars%rfield_4d => grid%aerosolc_1
  grid%tail_statevars%num_table => aerosolc_num_table
  grid%tail_statevars%index_table => aerosolc_index_table
  grid%tail_statevars%boundary_table => aerosolc_boundary_table
  grid%tail_statevars%dname_table => aerosolc_dname_table
  grid%tail_statevars%desc_table => aerosolc_desc_table
  grid%tail_statevars%units_table => aerosolc_units_table
  grid%tail_statevars%streams_table => aerosolc_streams_table
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%paerlev
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%paerlev
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%paerlev
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'paerlev'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%aerosolc_1(1,1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9481,&
    'frame/module_domain.f: Failed to allocate grid%aerosolc_1(1,1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aerosolc_2').AND.(IAND(2,tl).NE.0))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((model_config_rec%paerlev)-(1)+1))*(((em33)-(sm33)+1)*num_aerosolc)) * 4
  ALLOCATE(grid%aerosolc_2(sm31:em31,1:model_config_rec%paerlev,sm33:em33,num_aerosolc),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9490,&
    'frame/module_domain.f: Failed to allocate grid%aerosolc_2(sm31:em31,1:model_config_rec%paerlev,sm33:em33,num_aerosolc). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aerosolc_2=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aerosolc_2'
  grid%tail_statevars%DataName = 'AEROSOLC_2'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 202
  grid%tail_statevars%Ndim = 4
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .TRUE.
  grid%tail_statevars%rfield_4d => grid%aerosolc_2
  grid%tail_statevars%num_table => aerosolc_num_table
  grid%tail_statevars%index_table => aerosolc_index_table
  grid%tail_statevars%boundary_table => aerosolc_boundary_table
  grid%tail_statevars%dname_table => aerosolc_dname_table
  grid%tail_statevars%desc_table => aerosolc_desc_table
  grid%tail_statevars%units_table => aerosolc_units_table
  grid%tail_statevars%streams_table => aerosolc_streams_table
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = config_flags%paerlev
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = config_flags%paerlev
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = config_flags%paerlev
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'paerlev'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%aerosolc_2(1,1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9545,&
    'frame/module_domain.f: Failed to allocate grid%aerosolc_2(1,1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'m_hybi').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((model_config_rec%paerlev)-(1)+1))) * 4
  ALLOCATE(grid%m_hybi(1:model_config_rec%paerlev),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9554,&
    'frame/module_domain.f: Failed to allocate grid%m_hybi(1:model_config_rec%paerlev). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%m_hybi=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'm_hybi'
  grid%tail_statevars%DataName = 'M_HYBI'
  grid%tail_statevars%Description = 'MATCH hybi'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'Z'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%m_hybi
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = 1
  grid%tail_statevars%ed1 = config_flags%paerlev
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = 1
  grid%tail_statevars%em1 = config_flags%paerlev
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = 1
  grid%tail_statevars%ep1 = config_flags%paerlev
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'paerlev'
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%m_hybi(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9602,&
    'frame/module_domain.f: Failed to allocate grid%m_hybi(1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'f_ice_phy'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%f_ice_phy(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9611,&
    'frame/module_domain.f: Failed to allocate grid%f_ice_phy(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%f_ice_phy=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'f_ice_phy'
  grid%tail_statevars%DataName = 'F_ICE_PHY'
  grid%tail_statevars%Description = 'FRACTION OF ICE'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%f_ice_phy
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%f_ice_phy(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9659,&
    'frame/module_domain.f: Failed to allocate grid%f_ice_phy(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'f_rain_phy'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%f_rain_phy(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9668,&
    'frame/module_domain.f: Failed to allocate grid%f_rain_phy(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%f_rain_phy=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'f_rain_phy'
  grid%tail_statevars%DataName = 'F_RAIN_PHY'
  grid%tail_statevars%Description = 'FRACTION OF RAIN '
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%f_rain_phy
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%f_rain_phy(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9716,&
    'frame/module_domain.f: Failed to allocate grid%f_rain_phy(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'f_rimef_phy'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%f_rimef_phy(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9725,&
    'frame/module_domain.f: Failed to allocate grid%f_rimef_phy(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%f_rimef_phy=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'f_rimef_phy'
  grid%tail_statevars%DataName = 'F_RIMEF_PHY'
  grid%tail_statevars%Description = 'MASS RATIO OF RIMED ICE '
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%f_rimef_phy
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%f_rimef_phy(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9773,&
    'frame/module_domain.f: Failed to allocate grid%f_rimef_phy(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qndropsource').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%qndropsource(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9782,&
    'frame/module_domain.f: Failed to allocate grid%qndropsource(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qndropsource=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qndropsource'
  grid%tail_statevars%DataName = 'QNDROPSOURCE'
  grid%tail_statevars%Description = 'Droplet number source'
  grid%tail_statevars%Units = ' /kg/s'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%qndropsource
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%qndropsource(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9830,&
    'frame/module_domain.f: Failed to allocate grid%qndropsource(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'h_diabatic'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%h_diabatic(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9839,&
    'frame/module_domain.f: Failed to allocate grid%h_diabatic(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%h_diabatic=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'h_diabatic'
  grid%tail_statevars%DataName = 'H_DIABATIC'
  grid%tail_statevars%Description = 'PREVIOUS TIMESTEP CONDENSATIONAL HEATING'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%h_diabatic
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%h_diabatic(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9887,&
    'frame/module_domain.f: Failed to allocate grid%h_diabatic(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msft'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msft(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9896,&
    'frame/module_domain.f: Failed to allocate grid%msft(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msft=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msft'
  grid%tail_statevars%DataName = 'MAPFAC_M'
  grid%tail_statevars%Description = 'Map scale factor on mass grid'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msft
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msft(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9944,&
    'frame/module_domain.f: Failed to allocate grid%msft(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfu'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfu(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",9953,&
    'frame/module_domain.f: Failed to allocate grid%msfu(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfu=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfu'
  grid%tail_statevars%DataName = 'MAPFAC_U'
  grid%tail_statevars%Description = 'Map scale factor on u-grid'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'X'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfu
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = ide
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( ide, ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east_stag'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfu(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10001,&
    'frame/module_domain.f: Failed to allocate grid%msfu(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfv'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10010,&
    'frame/module_domain.f: Failed to allocate grid%msfv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfv'
  grid%tail_statevars%DataName = 'MAPFAC_V'
  grid%tail_statevars%Description = 'Map scale factor on v-grid'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'Y'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfv
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = jde
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( jde, jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north_stag'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10058,&
    'frame/module_domain.f: Failed to allocate grid%msfv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msftx'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msftx(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10067,&
    'frame/module_domain.f: Failed to allocate grid%msftx(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msftx=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msftx'
  grid%tail_statevars%DataName = 'MAPFAC_MX'
  grid%tail_statevars%Description = 'Map scale factor on mass grid, x direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msftx
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msftx(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10115,&
    'frame/module_domain.f: Failed to allocate grid%msftx(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfty'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfty(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10124,&
    'frame/module_domain.f: Failed to allocate grid%msfty(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfty=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfty'
  grid%tail_statevars%DataName = 'MAPFAC_MY'
  grid%tail_statevars%Description = 'Map scale factor on mass grid, y direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfty
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfty(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10172,&
    'frame/module_domain.f: Failed to allocate grid%msfty(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfux'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfux(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10181,&
    'frame/module_domain.f: Failed to allocate grid%msfux(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfux=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfux'
  grid%tail_statevars%DataName = 'MAPFAC_UX'
  grid%tail_statevars%Description = 'Map scale factor on u-grid, x direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'X'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfux
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = ide
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( ide, ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east_stag'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfux(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10229,&
    'frame/module_domain.f: Failed to allocate grid%msfux(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfuy'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfuy(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10238,&
    'frame/module_domain.f: Failed to allocate grid%msfuy(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfuy=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfuy'
  grid%tail_statevars%DataName = 'MAPFAC_UY'
  grid%tail_statevars%Description = 'Map scale factor on u-grid, y direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'X'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfuy
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = ide
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( ide, ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east_stag'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfuy(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10286,&
    'frame/module_domain.f: Failed to allocate grid%msfuy(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfvx'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfvx(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10295,&
    'frame/module_domain.f: Failed to allocate grid%msfvx(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfvx=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfvx'
  grid%tail_statevars%DataName = 'MAPFAC_VX'
  grid%tail_statevars%Description = 'Map scale factor on v-grid, x direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'Y'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfvx
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = jde
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( jde, jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north_stag'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfvx(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10343,&
    'frame/module_domain.f: Failed to allocate grid%msfvx(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfvx_inv'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfvx_inv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10352,&
    'frame/module_domain.f: Failed to allocate grid%msfvx_inv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfvx_inv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfvx_inv'
  grid%tail_statevars%DataName = 'MF_VX_INV'
  grid%tail_statevars%Description = 'Inverse map scale factor on v-grid, x direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'Y'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfvx_inv
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = jde
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( jde, jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north_stag'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfvx_inv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10400,&
    'frame/module_domain.f: Failed to allocate grid%msfvx_inv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'msfvy'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%msfvy(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10409,&
    'frame/module_domain.f: Failed to allocate grid%msfvy(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%msfvy=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'msfvy'
  grid%tail_statevars%DataName = 'MAPFAC_VY'
  grid%tail_statevars%Description = 'Map scale factor on v-grid, y direction'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'Y'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%msfvy
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = jde
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( jde, jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north_stag'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%msfvy(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10457,&
    'frame/module_domain.f: Failed to allocate grid%msfvy(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'f'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%f(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10466,&
    'frame/module_domain.f: Failed to allocate grid%f(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%f=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'f'
  grid%tail_statevars%DataName = 'F'
  grid%tail_statevars%Description = 'Coriolis sine latitude term'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%f
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%f(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10514,&
    'frame/module_domain.f: Failed to allocate grid%f(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'e'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%e(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10523,&
    'frame/module_domain.f: Failed to allocate grid%e(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%e=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'e'
  grid%tail_statevars%DataName = 'E'
  grid%tail_statevars%Description = 'Coriolis cosine latitude term'
  grid%tail_statevars%Units = 's-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%e
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%e(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10571,&
    'frame/module_domain.f: Failed to allocate grid%e(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'sina'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%sina(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10580,&
    'frame/module_domain.f: Failed to allocate grid%sina(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%sina=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'sina'
  grid%tail_statevars%DataName = 'SINALPHA'
  grid%tail_statevars%Description = 'Local sine of map rotation'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%sina
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%sina(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10628,&
    'frame/module_domain.f: Failed to allocate grid%sina(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cosa'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cosa(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10637,&
    'frame/module_domain.f: Failed to allocate grid%cosa(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cosa=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cosa'
  grid%tail_statevars%DataName = 'COSALPHA'
  grid%tail_statevars%Description = 'Local cosine of map rotation'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%cosa
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%cosa(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10685,&
    'frame/module_domain.f: Failed to allocate grid%cosa(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ht'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ht(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10694,&
    'frame/module_domain.f: Failed to allocate grid%ht(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ht'
  grid%tail_statevars%DataName = 'HGT'
  grid%tail_statevars%Description = 'Terrain Height'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ht
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ht(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10742,&
    'frame/module_domain.f: Failed to allocate grid%ht(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ht_fine').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ht_fine(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10751,&
    'frame/module_domain.f: Failed to allocate grid%ht_fine(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_fine=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ht_fine'
  grid%tail_statevars%DataName = 'HGT_FINE'
  grid%tail_statevars%Description = 'Fine Terrain Height'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ht_fine
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ht_fine(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10799,&
    'frame/module_domain.f: Failed to allocate grid%ht_fine(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ht_int').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ht_int(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10808,&
    'frame/module_domain.f: Failed to allocate grid%ht_int(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_int=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ht_int'
  grid%tail_statevars%DataName = 'HGT_INT'
  grid%tail_statevars%Description = 'Terrain Height Horizontally Interpolated'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ht_int
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ht_int(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10856,&
    'frame/module_domain.f: Failed to allocate grid%ht_int(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ht_input').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ht_input(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10865,&
    'frame/module_domain.f: Failed to allocate grid%ht_input(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_input=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ht_input'
  grid%tail_statevars%DataName = 'HGT_INPUT'
  grid%tail_statevars%Description = 'Terrain Height from FG Input File'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ht_input
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ht_input(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10913,&
    'frame/module_domain.f: Failed to allocate grid%ht_input(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ht_shad'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ht_shad(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10922,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ht_shad'
  grid%tail_statevars%DataName = 'HGT_SHAD'
  grid%tail_statevars%Description = 'Height of orographic shadow'
  grid%tail_statevars%Units = 'm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%ht_shad
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ht_shad(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10970,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad(1,1).  ')
  endif
ENDIF
IF(.TRUE..AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
(((em33-sm33+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_bxs(sm33:em33,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10979,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bxs(sm33:em33,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_bxs=initial_data_value
  num_bytes_allocated = num_bytes_allocated + &
(((em33-sm33+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_bxe(sm33:em33,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10987,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bxe(sm33:em33,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_bxe=initial_data_value
  num_bytes_allocated = num_bytes_allocated + &
(((em31-sm31+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_bys(sm31:em31,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",10995,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bys(sm31:em31,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_bys=initial_data_value
  num_bytes_allocated = num_bytes_allocated + &
(((em31-sm31+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_bye(sm31:em31,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11003,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bye(sm31:em31,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_bye=initial_data_value
ELSE
  ALLOCATE(grid%ht_shad_bxs(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11010,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bxs(1,1,1).  ')
  endif
  ALLOCATE(grid%ht_shad_bxe(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11015,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bxe(1,1,1).  ')
  endif
  ALLOCATE(grid%ht_shad_bys(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11020,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bys(1,1,1).  ')
  endif
  ALLOCATE(grid%ht_shad_bye(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11025,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_bye(1,1,1).  ')
  endif
ENDIF
IF(.TRUE..AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
(((em33-sm33+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_btxs(sm33:em33,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11034,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btxs(sm33:em33,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_btxs=initial_data_value
  num_bytes_allocated = num_bytes_allocated + &
(((em33-sm33+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_btxe(sm33:em33,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11042,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btxe(sm33:em33,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_btxe=initial_data_value
  num_bytes_allocated = num_bytes_allocated + &
(((em31-sm31+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_btys(sm31:em31,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11050,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btys(sm31:em31,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_btys=initial_data_value
  num_bytes_allocated = num_bytes_allocated + &
(((em31-sm31+1)*(spec_bdy_width))) * 4
  ALLOCATE(grid%ht_shad_btye(sm31:em31,1,spec_bdy_width),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11058,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btye(sm31:em31,1,spec_bdy_width). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ht_shad_btye=initial_data_value
ELSE
  ALLOCATE(grid%ht_shad_btxs(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11065,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btxs(1,1,1).  ')
  endif
  ALLOCATE(grid%ht_shad_btxe(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11070,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btxe(1,1,1).  ')
  endif
  ALLOCATE(grid%ht_shad_btys(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11075,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btys(1,1,1).  ')
  endif
  ALLOCATE(grid%ht_shad_btye(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11080,&
    'frame/module_domain.f: Failed to allocate grid%ht_shad_btye(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'shadowmask').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%shadowmask(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11089,&
    'frame/module_domain.f: Failed to allocate grid%shadowmask(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%shadowmask=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'shadowmask'
  grid%tail_statevars%DataName = 'SHADOWMASK'
  grid%tail_statevars%Description = '-'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%shadowmask
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%shadowmask(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11137,&
    'frame/module_domain.f: Failed to allocate grid%shadowmask(1,1).  ')
  endif
ENDIF
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'min_ptchsz'
   grid%tail_statevars%DataName = 'MIN_PTCHSZ'
   grid%tail_statevars%Description = '-'
   grid%tail_statevars%Units = '-'
   grid%tail_statevars%Type = 'i'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%ifield_0d => grid%min_ptchsz
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%min_ptchsz=0
IF(in_use_for_config(id,'tsk'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tsk(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11165,&
    'frame/module_domain.f: Failed to allocate grid%tsk(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tsk=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tsk'
  grid%tail_statevars%DataName = 'TSK'
  grid%tail_statevars%Description = 'SURFACE SKIN TEMPERATURE'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tsk
  grid%tail_statevars%streams(1) = 234881025
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tsk(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11213,&
    'frame/module_domain.f: Failed to allocate grid%tsk(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'dfi_tsk').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%dfi_tsk(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11222,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tsk(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%dfi_tsk=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'dfi_tsk'
  grid%tail_statevars%DataName = 'TSK_DFI'
  grid%tail_statevars%Description = 'saved SURFACE SKIN TEMPERATURE'
  grid%tail_statevars%Units = '-'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%dfi_tsk
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%dfi_tsk(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11270,&
    'frame/module_domain.f: Failed to allocate grid%dfi_tsk(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'tsk_save').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%tsk_save(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11279,&
    'frame/module_domain.f: Failed to allocate grid%tsk_save(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%tsk_save=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'tsk_save'
  grid%tail_statevars%DataName = 'TSK_SAVE'
  grid%tail_statevars%Description = 'SURFACE SKIN TEMPERATURE, EXTRA COPY FOR SEA ICE TESTS in REAL'
  grid%tail_statevars%Units = 'K'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%tsk_save
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%tsk_save(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11327,&
    'frame/module_domain.f: Failed to allocate grid%tsk_save(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'u_base').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em32)-(sm32)+1))) * 4
  ALLOCATE(grid%u_base(sm32:em32),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11336,&
    'frame/module_domain.f: Failed to allocate grid%u_base(sm32:em32). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%u_base=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'u_base'
  grid%tail_statevars%DataName = 'U_BASE'
  grid%tail_statevars%Description = 'BASE STATE X WIND IN IDEALIZED CASES'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'Z'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%u_base
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = kds
  grid%tail_statevars%ed1 = (kde-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = kms
  grid%tail_statevars%em1 = kme
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = kps
  grid%tail_statevars%ep1 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'bottom_top'
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%u_base(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11384,&
    'frame/module_domain.f: Failed to allocate grid%u_base(1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'v_base').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em32)-(sm32)+1))) * 4
  ALLOCATE(grid%v_base(sm32:em32),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11393,&
    'frame/module_domain.f: Failed to allocate grid%v_base(sm32:em32). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%v_base=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'v_base'
  grid%tail_statevars%DataName = 'V_BASE'
  grid%tail_statevars%Description = 'BASE STATE Y WIND IN IDEALIZED CASES'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'Z'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%v_base
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = kds
  grid%tail_statevars%ed1 = (kde-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = kms
  grid%tail_statevars%em1 = kme
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = kps
  grid%tail_statevars%ep1 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'bottom_top'
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%v_base(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11441,&
    'frame/module_domain.f: Failed to allocate grid%v_base(1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'qv_base').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em32)-(sm32)+1))) * 4
  ALLOCATE(grid%qv_base(sm32:em32),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11450,&
    'frame/module_domain.f: Failed to allocate grid%qv_base(sm32:em32). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%qv_base=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'qv_base'
  grid%tail_statevars%DataName = 'QV_BASE'
  grid%tail_statevars%Description = 'BASE STATE QV IN IDEALIZED CASES'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'Z'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%qv_base
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = kds
  grid%tail_statevars%ed1 = (kde-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = kms
  grid%tail_statevars%em1 = kme
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = kps
  grid%tail_statevars%ep1 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'bottom_top'
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%qv_base(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11498,&
    'frame/module_domain.f: Failed to allocate grid%qv_base(1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'z_base').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em32)-(sm32)+1))) * 4
  ALLOCATE(grid%z_base(sm32:em32),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11507,&
    'frame/module_domain.f: Failed to allocate grid%z_base(sm32:em32). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%z_base=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'z_base'
  grid%tail_statevars%DataName = 'Z_BASE'
  grid%tail_statevars%Description = 'BASE STATE HEIGHT IN IDEALIZED CASES'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'Z'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 1
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_1d => grid%z_base
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = kds
  grid%tail_statevars%ed1 = (kde-1)
  grid%tail_statevars%sd2 = 1
  grid%tail_statevars%ed2 = 1
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = kms
  grid%tail_statevars%em1 = kme
  grid%tail_statevars%sm2 = 1
  grid%tail_statevars%em2 = 1
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = kps
  grid%tail_statevars%ep1 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp2 = 1
  grid%tail_statevars%ep2 = 1
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'bottom_top'
  grid%tail_statevars%dimname2 = ''
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%z_base(1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11555,&
    'frame/module_domain.f: Failed to allocate grid%z_base(1).  ')
  endif
ENDIF
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'u_frame'
   grid%tail_statevars%DataName = 'U_FRAME'
   grid%tail_statevars%Description = 'FRAME X WIND'
   grid%tail_statevars%Units = 'm s-1'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%u_frame
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%u_frame=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'v_frame'
   grid%tail_statevars%DataName = 'V_FRAME'
   grid%tail_statevars%Description = 'FRAME Y WIND'
   grid%tail_statevars%Units = 'm s-1'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%v_frame
  grid%tail_statevars%streams(1) = 33554432
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%v_frame=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'p_top'
   grid%tail_statevars%DataName = 'P_TOP'
   grid%tail_statevars%Description = 'PRESSURE TOP OF THE MODEL'
   grid%tail_statevars%Units = 'Pa'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%p_top
  grid%tail_statevars%streams(1) = 33554433
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%p_top=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 't00'
   grid%tail_statevars%DataName = 'T00'
   grid%tail_statevars%Description = 'BASE STATE TEMPERATURE   '
   grid%tail_statevars%Units = 'K'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%t00
  grid%tail_statevars%streams(1) = 167772161
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%t00=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'p00'
   grid%tail_statevars%DataName = 'P00'
   grid%tail_statevars%Description = 'BASE STATE PRESURE'
   grid%tail_statevars%Units = 'Pa'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%p00
  grid%tail_statevars%streams(1) = 167772161
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%p00=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'tlp'
   grid%tail_statevars%DataName = 'TLP'
   grid%tail_statevars%Description = 'BASE STATE LAPSE RATE    '
   grid%tail_statevars%Units = ''
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%tlp
  grid%tail_statevars%streams(1) = 167772161
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%tlp=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'tiso'
   grid%tail_statevars%DataName = 'TISO'
   grid%tail_statevars%Description = 'TEMP AT WHICH THE BASE T TURNS CONST'
   grid%tail_statevars%Units = 'K'
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%tiso
  grid%tail_statevars%streams(1) = 167772161
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%tiso=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'max_msftx'
   grid%tail_statevars%DataName = 'MAX_MSTFX'
   grid%tail_statevars%Description = 'Max map factor in domain'
   grid%tail_statevars%Units = ''
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%max_msftx
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%max_msftx=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'max_msfty'
   grid%tail_statevars%DataName = 'MAX_MSTFY'
   grid%tail_statevars%Description = 'Max map factor in domain'
   grid%tail_statevars%Units = ''
   grid%tail_statevars%Type = 'r'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%rfield_0d => grid%max_msfty
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%max_msfty=initial_data_value
IF(in_use_for_config(id,'rthcuten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rthcuten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11735,&
    'frame/module_domain.f: Failed to allocate grid%rthcuten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rthcuten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rthcuten'
  grid%tail_statevars%DataName = 'RTHCUTEN'
  grid%tail_statevars%Description = 'COUPLED THETA TENDENCY DUE TO CUMULUS SCHEME'
  grid%tail_statevars%Units = 'Pa K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rthcuten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rthcuten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11783,&
    'frame/module_domain.f: Failed to allocate grid%rthcuten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rqvcuten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rqvcuten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11792,&
    'frame/module_domain.f: Failed to allocate grid%rqvcuten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rqvcuten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rqvcuten'
  grid%tail_statevars%DataName = 'RQVCUTEN'
  grid%tail_statevars%Description = 'COUPLED Q_V TENDENCY DUE TO CUMULUS SCHEME'
  grid%tail_statevars%Units = 'Pa kg kg-1 s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rqvcuten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rqvcuten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11840,&
    'frame/module_domain.f: Failed to allocate grid%rqvcuten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rqrcuten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rqrcuten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11849,&
    'frame/module_domain.f: Failed to allocate grid%rqrcuten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rqrcuten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rqrcuten'
  grid%tail_statevars%DataName = 'RQRCUTEN'
  grid%tail_statevars%Description = 'COUPLED Q_R TENDENCY DUE TO CUMULUS SCHEME'
  grid%tail_statevars%Units = 'Pa kg kg-1 s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rqrcuten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rqrcuten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11897,&
    'frame/module_domain.f: Failed to allocate grid%rqrcuten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rqccuten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rqccuten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11906,&
    'frame/module_domain.f: Failed to allocate grid%rqccuten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rqccuten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rqccuten'
  grid%tail_statevars%DataName = 'RQCCUTEN'
  grid%tail_statevars%Description = 'COUPLED Q_C TENDENCY DUE TO CUMULUS SCHEME'
  grid%tail_statevars%Units = 'Pa kg kg-1 s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rqccuten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rqccuten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11954,&
    'frame/module_domain.f: Failed to allocate grid%rqccuten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rqscuten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rqscuten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",11963,&
    'frame/module_domain.f: Failed to allocate grid%rqscuten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rqscuten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rqscuten'
  grid%tail_statevars%DataName = 'RQSCUTEN'
  grid%tail_statevars%Description = 'COUPLED Q_S TENDENCY DUE TO CUMULUS SCHEME'
  grid%tail_statevars%Units = 'Pa kg kg-1 s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rqscuten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rqscuten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12011,&
    'frame/module_domain.f: Failed to allocate grid%rqscuten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rqicuten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rqicuten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12020,&
    'frame/module_domain.f: Failed to allocate grid%rqicuten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rqicuten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rqicuten'
  grid%tail_statevars%DataName = 'RQICUTEN'
  grid%tail_statevars%Description = 'COUPLED Q_I TENDENCY DUE TO CUMULUS SCHEME'
  grid%tail_statevars%Units = 'Pa kg kg-1 s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rqicuten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rqicuten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12068,&
    'frame/module_domain.f: Failed to allocate grid%rqicuten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'w0avg').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%w0avg(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12077,&
    'frame/module_domain.f: Failed to allocate grid%w0avg(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%w0avg=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'w0avg'
  grid%tail_statevars%DataName = 'W0AVG'
  grid%tail_statevars%Description = 'AVERAGE VERTICAL VELOCITY FOR KF CUMULUS SCHEME'
  grid%tail_statevars%Units = 'm s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%w0avg
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%w0avg(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12125,&
    'frame/module_domain.f: Failed to allocate grid%w0avg(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rainc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rainc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12134,&
    'frame/module_domain.f: Failed to allocate grid%rainc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rainc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rainc'
  grid%tail_statevars%DataName = 'RAINC'
  grid%tail_statevars%Description = 'ACCUMULATED TOTAL CUMULUS PRECIPITATION'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rainc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rainc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12182,&
    'frame/module_domain.f: Failed to allocate grid%rainc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rainnc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rainnc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12191,&
    'frame/module_domain.f: Failed to allocate grid%rainnc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rainnc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rainnc'
  grid%tail_statevars%DataName = 'RAINNC'
  grid%tail_statevars%Description = 'ACCUMULATED TOTAL GRID SCALE PRECIPITATION'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rainnc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rainnc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12239,&
    'frame/module_domain.f: Failed to allocate grid%rainnc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_rainc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_rainc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12248,&
    'frame/module_domain.f: Failed to allocate grid%i_rainc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_rainc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_rainc'
  grid%tail_statevars%DataName = 'I_RAINC'
  grid%tail_statevars%Description = 'BUCKET FOR RAINC'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_rainc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_rainc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12296,&
    'frame/module_domain.f: Failed to allocate grid%i_rainc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_rainnc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_rainnc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12305,&
    'frame/module_domain.f: Failed to allocate grid%i_rainnc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_rainnc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_rainnc'
  grid%tail_statevars%DataName = 'I_RAINNC'
  grid%tail_statevars%Description = 'BUCKET FOR RAINNC'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_rainnc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_rainnc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12353,&
    'frame/module_domain.f: Failed to allocate grid%i_rainnc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'pratec').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%pratec(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12362,&
    'frame/module_domain.f: Failed to allocate grid%pratec(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%pratec=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'pratec'
  grid%tail_statevars%DataName = 'PRATEC'
  grid%tail_statevars%Description = 'PRECIP RATE FROM CUMULUS SCHEME'
  grid%tail_statevars%Units = 'mm s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%pratec
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%pratec(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12410,&
    'frame/module_domain.f: Failed to allocate grid%pratec(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'raincv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%raincv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12419,&
    'frame/module_domain.f: Failed to allocate grid%raincv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%raincv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'raincv'
  grid%tail_statevars%DataName = 'RAINCV'
  grid%tail_statevars%Description = 'TIME-STEP CUMULUS PRECIPITATION'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%raincv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%raincv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12467,&
    'frame/module_domain.f: Failed to allocate grid%raincv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rainncv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rainncv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12476,&
    'frame/module_domain.f: Failed to allocate grid%rainncv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rainncv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rainncv'
  grid%tail_statevars%DataName = 'RAINNCV'
  grid%tail_statevars%Description = 'TIME-STEP NONCONVECTIVE PRECIPITATION'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rainncv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rainncv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12524,&
    'frame/module_domain.f: Failed to allocate grid%rainncv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rainbl').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rainbl(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12533,&
    'frame/module_domain.f: Failed to allocate grid%rainbl(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rainbl=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rainbl'
  grid%tail_statevars%DataName = 'RAINBL'
  grid%tail_statevars%Description = 'PBL TIME-STEP TOTAL PRECIPITATION'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%rainbl
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%rainbl(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12581,&
    'frame/module_domain.f: Failed to allocate grid%rainbl(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'snownc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%snownc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12590,&
    'frame/module_domain.f: Failed to allocate grid%snownc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%snownc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'snownc'
  grid%tail_statevars%DataName = 'SNOWNC'
  grid%tail_statevars%Description = 'ACCUMULATED TOTAL GRID SCALE SNOW AND ICE'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%snownc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%snownc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12638,&
    'frame/module_domain.f: Failed to allocate grid%snownc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'graupelnc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%graupelnc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12647,&
    'frame/module_domain.f: Failed to allocate grid%graupelnc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%graupelnc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'graupelnc'
  grid%tail_statevars%DataName = 'GRAUPELNC'
  grid%tail_statevars%Description = 'ACCUMULATED TOTAL GRID SCALE GRAUPEL'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%graupelnc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%graupelnc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12695,&
    'frame/module_domain.f: Failed to allocate grid%graupelnc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'hailnc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%hailnc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12704,&
    'frame/module_domain.f: Failed to allocate grid%hailnc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%hailnc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'hailnc'
  grid%tail_statevars%DataName = 'HAILNC'
  grid%tail_statevars%Description = 'ACCUMULATED TOTAL GRID SCALE HAIL'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%hailnc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%hailnc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12752,&
    'frame/module_domain.f: Failed to allocate grid%hailnc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'snowncv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%snowncv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12761,&
    'frame/module_domain.f: Failed to allocate grid%snowncv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%snowncv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'snowncv'
  grid%tail_statevars%DataName = 'SNOWNCV'
  grid%tail_statevars%Description = 'TIME-STEP NONCONVECTIVE SNOW AND ICE'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%snowncv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%snowncv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12809,&
    'frame/module_domain.f: Failed to allocate grid%snowncv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'graupelncv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%graupelncv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12818,&
    'frame/module_domain.f: Failed to allocate grid%graupelncv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%graupelncv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'graupelncv'
  grid%tail_statevars%DataName = 'GRAUPELNCV'
  grid%tail_statevars%Description = 'TIME-STEP NONCONVECTIVE GRAUPEL'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%graupelncv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%graupelncv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12866,&
    'frame/module_domain.f: Failed to allocate grid%graupelncv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'hailncv').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%hailncv(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12875,&
    'frame/module_domain.f: Failed to allocate grid%hailncv(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%hailncv=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'hailncv'
  grid%tail_statevars%DataName = 'HAILNCV'
  grid%tail_statevars%Description = 'TIME-STEP NONCONVECTIVE HAIL'
  grid%tail_statevars%Units = 'mm'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%hailncv
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%hailncv(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12923,&
    'frame/module_domain.f: Failed to allocate grid%hailncv(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'refl_10cm'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%refl_10cm(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12932,&
    'frame/module_domain.f: Failed to allocate grid%refl_10cm(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%refl_10cm=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'refl_10cm'
  grid%tail_statevars%DataName = 'REFL_10CM'
  grid%tail_statevars%Description = 'Radar reflectivity (lamda = 10 cm)'
  grid%tail_statevars%Units = 'dBZ'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%refl_10cm
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%refl_10cm(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12980,&
    'frame/module_domain.f: Failed to allocate grid%refl_10cm(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'nca').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%nca(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",12989,&
    'frame/module_domain.f: Failed to allocate grid%nca(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%nca=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'nca'
  grid%tail_statevars%DataName = 'NCA'
  grid%tail_statevars%Description = 'COUNTER OF THE CLOUD RELAXATION TIME IN KF CUMULUS SCHEME'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%nca
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%nca(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13037,&
    'frame/module_domain.f: Failed to allocate grid%nca(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lowlyr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lowlyr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13046,&
    'frame/module_domain.f: Failed to allocate grid%lowlyr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lowlyr=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lowlyr'
  grid%tail_statevars%DataName = 'LOWLYR'
  grid%tail_statevars%Description = 'INDEX OF LOWEST MODEL LAYER ABOVE THE GROUND IN BMJ SCHEME'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%lowlyr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lowlyr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13094,&
    'frame/module_domain.f: Failed to allocate grid%lowlyr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'mass_flux').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%mass_flux(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13103,&
    'frame/module_domain.f: Failed to allocate grid%mass_flux(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%mass_flux=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'mass_flux'
  grid%tail_statevars%DataName = 'MASS_FLUX'
  grid%tail_statevars%Description = 'DOWNDRAFT MASS FLUX FOR IN GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'mb hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%mass_flux
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%mass_flux(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13151,&
    'frame/module_domain.f: Failed to allocate grid%mass_flux(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_gr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_gr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13160,&
    'frame/module_domain.f: Failed to allocate grid%apr_gr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_gr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_gr'
  grid%tail_statevars%DataName = 'APR_GR'
  grid%tail_statevars%Description = 'PRECIP FROM CLOSURE OLD_GRELL'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_gr
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_gr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13208,&
    'frame/module_domain.f: Failed to allocate grid%apr_gr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_w').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_w(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13217,&
    'frame/module_domain.f: Failed to allocate grid%apr_w(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_w=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_w'
  grid%tail_statevars%DataName = 'APR_W'
  grid%tail_statevars%Description = 'PRECIP FROM CLOSURE W'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_w
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_w(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13265,&
    'frame/module_domain.f: Failed to allocate grid%apr_w(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_mc').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_mc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13274,&
    'frame/module_domain.f: Failed to allocate grid%apr_mc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_mc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_mc'
  grid%tail_statevars%DataName = 'APR_MC'
  grid%tail_statevars%Description = 'PRECIP FROM CLOSURE KRISH MV'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_mc
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_mc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13322,&
    'frame/module_domain.f: Failed to allocate grid%apr_mc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_st').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_st(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13331,&
    'frame/module_domain.f: Failed to allocate grid%apr_st(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_st=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_st'
  grid%tail_statevars%DataName = 'APR_ST'
  grid%tail_statevars%Description = 'PRECIP FROM CLOSURE STABILITY'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_st
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_st(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13379,&
    'frame/module_domain.f: Failed to allocate grid%apr_st(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_as').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_as(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13388,&
    'frame/module_domain.f: Failed to allocate grid%apr_as(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_as=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_as'
  grid%tail_statevars%DataName = 'APR_AS'
  grid%tail_statevars%Description = 'PRECIP FROM CLOSURE AS-TYPE'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_as
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_as(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13436,&
    'frame/module_domain.f: Failed to allocate grid%apr_as(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_capma').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_capma(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13445,&
    'frame/module_domain.f: Failed to allocate grid%apr_capma(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_capma=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_capma'
  grid%tail_statevars%DataName = 'APR_CAPMA'
  grid%tail_statevars%Description = 'PRECIP FROM MAX CAP'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_capma
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_capma(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13493,&
    'frame/module_domain.f: Failed to allocate grid%apr_capma(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_capme').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_capme(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13502,&
    'frame/module_domain.f: Failed to allocate grid%apr_capme(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_capme=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_capme'
  grid%tail_statevars%DataName = 'APR_CAPME'
  grid%tail_statevars%Description = 'PRECIP FROM MEAN CAP'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_capme
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_capme(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13550,&
    'frame/module_domain.f: Failed to allocate grid%apr_capme(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'apr_capmi').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%apr_capmi(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13559,&
    'frame/module_domain.f: Failed to allocate grid%apr_capmi(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%apr_capmi=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'apr_capmi'
  grid%tail_statevars%DataName = 'APR_CAPMI'
  grid%tail_statevars%Description = 'PRECIP FROM MIN CAP'
  grid%tail_statevars%Units = 'mm hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%apr_capmi
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%apr_capmi(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13607,&
    'frame/module_domain.f: Failed to allocate grid%apr_capmi(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'edt_out').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%edt_out(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13616,&
    'frame/module_domain.f: Failed to allocate grid%edt_out(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%edt_out=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'edt_out'
  grid%tail_statevars%DataName = 'EDT_OUT'
  grid%tail_statevars%Description = 'EDT FROM GD SCHEME'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%edt_out
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%edt_out(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13664,&
    'frame/module_domain.f: Failed to allocate grid%edt_out(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xmb_shallow').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xmb_shallow(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13673,&
    'frame/module_domain.f: Failed to allocate grid%xmb_shallow(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xmb_shallow=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xmb_shallow'
  grid%tail_statevars%DataName = 'XMB_SHALLOW'
  grid%tail_statevars%Description = 'MASSFLUX FROM SHALLOW CONVECTION (G3 only)'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xmb_shallow
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xmb_shallow(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13721,&
    'frame/module_domain.f: Failed to allocate grid%xmb_shallow(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'k22_shallow').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%k22_shallow(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13730,&
    'frame/module_domain.f: Failed to allocate grid%k22_shallow(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%k22_shallow=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'k22_shallow'
  grid%tail_statevars%DataName = 'K22_SHALLOW'
  grid%tail_statevars%Description = 'K22 LEVEL FROM SHALLOW CONVECTION (G3 only)'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%k22_shallow
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%k22_shallow(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13778,&
    'frame/module_domain.f: Failed to allocate grid%k22_shallow(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'kbcon_shallow').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%kbcon_shallow(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13787,&
    'frame/module_domain.f: Failed to allocate grid%kbcon_shallow(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%kbcon_shallow=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'kbcon_shallow'
  grid%tail_statevars%DataName = 'KBCON_SHALLOW'
  grid%tail_statevars%Description = 'KBCON LEVEL FROM SHALLOW CONVECTION (G3 only)'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%kbcon_shallow
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%kbcon_shallow(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13835,&
    'frame/module_domain.f: Failed to allocate grid%kbcon_shallow(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'ktop_shallow').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%ktop_shallow(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13844,&
    'frame/module_domain.f: Failed to allocate grid%ktop_shallow(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%ktop_shallow=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'ktop_shallow'
  grid%tail_statevars%DataName = 'KTOP_SHALLOW'
  grid%tail_statevars%Description = 'KTOP LEVEL FROM SHALLOW CONVECTION (G3 only)'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%ktop_shallow
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%ktop_shallow(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13892,&
    'frame/module_domain.f: Failed to allocate grid%ktop_shallow(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xf_ens').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))*(((model_config_rec%ensdim)-(1)+1))) * 4
  ALLOCATE(grid%xf_ens(sm31:em31,sm33:em33,1:model_config_rec%ensdim),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13901,&
    'frame/module_domain.f: Failed to allocate grid%xf_ens(sm31:em31,sm33:em33,1:model_config_rec%ensdim). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xf_ens=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xf_ens'
  grid%tail_statevars%DataName = 'XF_ENS'
  grid%tail_statevars%Description = 'MASS FLUX PDF IN GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'mb hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XYZ'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%xf_ens
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = config_flags%ensdim
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = config_flags%ensdim
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = config_flags%ensdim
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = 'ensemble_stag'
  ENDIF
ELSE
  ALLOCATE(grid%xf_ens(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13949,&
    'frame/module_domain.f: Failed to allocate grid%xf_ens(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'pr_ens').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))*(((model_config_rec%ensdim)-(1)+1))) * 4
  ALLOCATE(grid%pr_ens(sm31:em31,sm33:em33,1:model_config_rec%ensdim),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",13958,&
    'frame/module_domain.f: Failed to allocate grid%pr_ens(sm31:em31,sm33:em33,1:model_config_rec%ensdim). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%pr_ens=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'pr_ens'
  grid%tail_statevars%DataName = 'PR_ENS'
  grid%tail_statevars%Description = 'PRECIP RATE PDF IN GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'mb hour-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XYZ'
  grid%tail_statevars%Stagger = 'Z'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%pr_ens
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = config_flags%ensdim
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = config_flags%ensdim
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = config_flags%ensdim
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = 'ensemble_stag'
  ENDIF
ELSE
  ALLOCATE(grid%pr_ens(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14006,&
    'frame/module_domain.f: Failed to allocate grid%pr_ens(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cugd_tten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cugd_tten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14015,&
    'frame/module_domain.f: Failed to allocate grid%cugd_tten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cugd_tten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cugd_tten'
  grid%tail_statevars%DataName = 'CUGD_TTEN'
  grid%tail_statevars%Description = 'INITIAL TTENDENCY OUT OFF GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cugd_tten
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cugd_tten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14063,&
    'frame/module_domain.f: Failed to allocate grid%cugd_tten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cugd_qvten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cugd_qvten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14072,&
    'frame/module_domain.f: Failed to allocate grid%cugd_qvten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cugd_qvten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cugd_qvten'
  grid%tail_statevars%DataName = 'CUGD_QVTEN'
  grid%tail_statevars%Description = 'INITIAL QTENDENCY OUT OFF GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cugd_qvten
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cugd_qvten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14120,&
    'frame/module_domain.f: Failed to allocate grid%cugd_qvten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cugd_ttens').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cugd_ttens(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14129,&
    'frame/module_domain.f: Failed to allocate grid%cugd_ttens(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cugd_ttens=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cugd_ttens'
  grid%tail_statevars%DataName = 'CUGD_TTENS'
  grid%tail_statevars%Description = 'INITIAL SUBSIDENCE TTENDENCY OUT OFF GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cugd_ttens
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cugd_ttens(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14177,&
    'frame/module_domain.f: Failed to allocate grid%cugd_ttens(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cugd_qvtens').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cugd_qvtens(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14186,&
    'frame/module_domain.f: Failed to allocate grid%cugd_qvtens(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cugd_qvtens=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cugd_qvtens'
  grid%tail_statevars%DataName = 'CUGD_QVTENS'
  grid%tail_statevars%Description = 'INITIAL SUBSIDNCE QTENDENCY OUT OFF GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cugd_qvtens
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cugd_qvtens(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14234,&
    'frame/module_domain.f: Failed to allocate grid%cugd_qvtens(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cugd_qcten').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cugd_qcten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14243,&
    'frame/module_domain.f: Failed to allocate grid%cugd_qcten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cugd_qcten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cugd_qcten'
  grid%tail_statevars%DataName = 'CUGD_QCTEN'
  grid%tail_statevars%Description = 'INITIAL TEMPERATURE TENDENCY OUT OFF GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cugd_qcten
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cugd_qcten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14291,&
    'frame/module_domain.f: Failed to allocate grid%cugd_qcten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rthften').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rthften(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14300,&
    'frame/module_domain.f: Failed to allocate grid%rthften(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rthften=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rthften'
  grid%tail_statevars%DataName = 'RTHFTEN'
  grid%tail_statevars%Description = 'TEMPERATURE TENDENCY USED IN GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rthften
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rthften(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14348,&
    'frame/module_domain.f: Failed to allocate grid%rthften(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rqvften').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rqvften(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14357,&
    'frame/module_domain.f: Failed to allocate grid%rqvften(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rqvften=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rqvften'
  grid%tail_statevars%DataName = 'RQVFTEN'
  grid%tail_statevars%Description = 'MOISTURE TENDENCY USED IN GRELL CUMULUS SCHEME'
  grid%tail_statevars%Units = 'kg s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rqvften
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rqvften(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14405,&
    'frame/module_domain.f: Failed to allocate grid%rqvften(1,1,1).  ')
  endif
ENDIF
  IF (.NOT.grid%is_intermediate) THEN
   ALLOCATE( grid%tail_statevars%next )
   grid%tail_statevars => grid%tail_statevars%next
   NULLIFY( grid%tail_statevars%next )
   grid%tail_statevars%ProcOrient = '  '
   grid%tail_statevars%VarName = 'stepcu'
   grid%tail_statevars%DataName = 'STEPCU'
   grid%tail_statevars%Description = 'NUMBER OF FUNDAMENTAL TIMESTEPS BETWEEN CONVECTION CALLS'
   grid%tail_statevars%Units = ''
   grid%tail_statevars%Type = 'i'
   grid%tail_statevars%Ntl = 0
   grid%tail_statevars%Restart = .TRUE.
   grid%tail_statevars%Ndim = 0
   grid%tail_statevars%scalar_array = .FALSE.
   grid%tail_statevars%ifield_0d => grid%stepcu
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  ENDIF
IF ( setinitval .EQ. 3 ) grid%stepcu=0
IF(in_use_for_config(id,'rthraten'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rthraten(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14433,&
    'frame/module_domain.f: Failed to allocate grid%rthraten(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rthraten=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rthraten'
  grid%tail_statevars%DataName = 'RTHRATEN'
  grid%tail_statevars%Description = 'COUPLED THETA TENDENCY DUE TO RADIATION'
  grid%tail_statevars%Units = 'Pa K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rthraten
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rthraten(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14481,&
    'frame/module_domain.f: Failed to allocate grid%rthraten(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rthratenlw').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rthratenlw(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14490,&
    'frame/module_domain.f: Failed to allocate grid%rthratenlw(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rthratenlw=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rthratenlw'
  grid%tail_statevars%DataName = 'RTHRATLW'
  grid%tail_statevars%Description = 'UNCOUPLED THETA TENDENCY DUE TO LONG WAVE RADIATION'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rthratenlw
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rthratenlw(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14538,&
    'frame/module_domain.f: Failed to allocate grid%rthratenlw(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'rthratensw').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%rthratensw(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14547,&
    'frame/module_domain.f: Failed to allocate grid%rthratensw(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%rthratensw=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'rthratensw'
  grid%tail_statevars%DataName = 'RTHRATSW'
  grid%tail_statevars%Description = 'UNCOUPLED THETA TENDENCY DUE TO SHORT WAVE RADIATION'
  grid%tail_statevars%Units = 'K s-1'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%rthratensw
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%rthratensw(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14595,&
    'frame/module_domain.f: Failed to allocate grid%rthratensw(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'cldfra').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em32)-(sm32)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%cldfra(sm31:em31,sm32:em32,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14604,&
    'frame/module_domain.f: Failed to allocate grid%cldfra(sm31:em31,sm32:em32,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%cldfra=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'cldfra'
  grid%tail_statevars%DataName = 'CLDFRA'
  grid%tail_statevars%Description = 'CLOUD FRACTION'
  grid%tail_statevars%Units = ''
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XZY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 3
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_3d => grid%cldfra
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = kds
  grid%tail_statevars%ed2 = (kde-1)
  grid%tail_statevars%sd3 = jds
  grid%tail_statevars%ed3 = (jde-1)
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = kms
  grid%tail_statevars%em2 = kme
  grid%tail_statevars%sm3 = jms
  grid%tail_statevars%em3 = jme
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = kps
  grid%tail_statevars%ep2 = MIN( (kde-1), kpe )
  grid%tail_statevars%sp3 = jps
  grid%tail_statevars%ep3 = MIN( (jde-1), jpe )
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'bottom_top'
  grid%tail_statevars%dimname3 = 'south_north'
  ENDIF
ELSE
  ALLOCATE(grid%cldfra(1,1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14652,&
    'frame/module_domain.f: Failed to allocate grid%cldfra(1,1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swdown'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swdown(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14661,&
    'frame/module_domain.f: Failed to allocate grid%swdown(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swdown=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swdown'
  grid%tail_statevars%DataName = 'SWDOWN'
  grid%tail_statevars%Description = 'DOWNWARD SHORT WAVE FLUX AT GROUND SURFACE'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swdown
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swdown(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14709,&
    'frame/module_domain.f: Failed to allocate grid%swdown(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swdownc').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swdownc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14718,&
    'frame/module_domain.f: Failed to allocate grid%swdownc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swdownc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swdownc'
  grid%tail_statevars%DataName = 'SWDOWNC'
  grid%tail_statevars%Description = 'DOWNWARD CLEAR-SKY SHORT WAVE FLUX AT GROUND SURFACE'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .FALSE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swdownc
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 0
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swdownc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14766,&
    'frame/module_domain.f: Failed to allocate grid%swdownc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'gsw'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%gsw(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14775,&
    'frame/module_domain.f: Failed to allocate grid%gsw(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%gsw=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'gsw'
  grid%tail_statevars%DataName = 'GSW'
  grid%tail_statevars%Description = 'NET SHORT WAVE FLUX AT GROUND SURFACE'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%gsw
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%gsw(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14823,&
    'frame/module_domain.f: Failed to allocate grid%gsw(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'glw'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%glw(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14832,&
    'frame/module_domain.f: Failed to allocate grid%glw(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%glw=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'glw'
  grid%tail_statevars%DataName = 'GLW'
  grid%tail_statevars%Description = 'DOWNWARD LONG WAVE FLUX AT GROUND SURFACE'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%glw
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%glw(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14880,&
    'frame/module_domain.f: Failed to allocate grid%glw(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swnorm'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swnorm(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14889,&
    'frame/module_domain.f: Failed to allocate grid%swnorm(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swnorm=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swnorm'
  grid%tail_statevars%DataName = 'SWNORM'
  grid%tail_statevars%Description = 'NORMAL SHORT WAVE FLUX AT GROUND SURFACE (SLOPE-DEPENDENT)'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swnorm
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swnorm(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14937,&
    'frame/module_domain.f: Failed to allocate grid%swnorm(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswupt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswupt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14946,&
    'frame/module_domain.f: Failed to allocate grid%acswupt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswupt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswupt'
  grid%tail_statevars%DataName = 'ACSWUPT'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswupt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswupt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",14994,&
    'frame/module_domain.f: Failed to allocate grid%acswupt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswuptc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswuptc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15003,&
    'frame/module_domain.f: Failed to allocate grid%acswuptc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswuptc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswuptc'
  grid%tail_statevars%DataName = 'ACSWUPTC'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING CLEAR SKY SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswuptc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswuptc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15051,&
    'frame/module_domain.f: Failed to allocate grid%acswuptc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswdnt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswdnt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15060,&
    'frame/module_domain.f: Failed to allocate grid%acswdnt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswdnt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswdnt'
  grid%tail_statevars%DataName = 'ACSWDNT'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswdnt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswdnt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15108,&
    'frame/module_domain.f: Failed to allocate grid%acswdnt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswdntc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswdntc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15117,&
    'frame/module_domain.f: Failed to allocate grid%acswdntc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswdntc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswdntc'
  grid%tail_statevars%DataName = 'ACSWDNTC'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswdntc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswdntc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15165,&
    'frame/module_domain.f: Failed to allocate grid%acswdntc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswupb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswupb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15174,&
    'frame/module_domain.f: Failed to allocate grid%acswupb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswupb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswupb'
  grid%tail_statevars%DataName = 'ACSWUPB'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswupb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswupb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15222,&
    'frame/module_domain.f: Failed to allocate grid%acswupb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswupbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswupbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15231,&
    'frame/module_domain.f: Failed to allocate grid%acswupbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswupbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswupbc'
  grid%tail_statevars%DataName = 'ACSWUPBC'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswupbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswupbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15279,&
    'frame/module_domain.f: Failed to allocate grid%acswupbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswdnb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswdnb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15288,&
    'frame/module_domain.f: Failed to allocate grid%acswdnb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswdnb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswdnb'
  grid%tail_statevars%DataName = 'ACSWDNB'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswdnb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswdnb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15336,&
    'frame/module_domain.f: Failed to allocate grid%acswdnb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'acswdnbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%acswdnbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15345,&
    'frame/module_domain.f: Failed to allocate grid%acswdnbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%acswdnbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'acswdnbc'
  grid%tail_statevars%DataName = 'ACSWDNBC'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%acswdnbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%acswdnbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15393,&
    'frame/module_domain.f: Failed to allocate grid%acswdnbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwupt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwupt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15402,&
    'frame/module_domain.f: Failed to allocate grid%aclwupt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwupt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwupt'
  grid%tail_statevars%DataName = 'ACLWUPT'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwupt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwupt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15450,&
    'frame/module_domain.f: Failed to allocate grid%aclwupt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwuptc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwuptc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15459,&
    'frame/module_domain.f: Failed to allocate grid%aclwuptc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwuptc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwuptc'
  grid%tail_statevars%DataName = 'ACLWUPTC'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING CLEAR SKY LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwuptc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwuptc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15507,&
    'frame/module_domain.f: Failed to allocate grid%aclwuptc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwdnt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwdnt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15516,&
    'frame/module_domain.f: Failed to allocate grid%aclwdnt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwdnt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwdnt'
  grid%tail_statevars%DataName = 'ACLWDNT'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwdnt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwdnt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15564,&
    'frame/module_domain.f: Failed to allocate grid%aclwdnt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwdntc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwdntc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15573,&
    'frame/module_domain.f: Failed to allocate grid%aclwdntc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwdntc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwdntc'
  grid%tail_statevars%DataName = 'ACLWDNTC'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING CLEAR SKY LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwdntc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwdntc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15621,&
    'frame/module_domain.f: Failed to allocate grid%aclwdntc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwupb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwupb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15630,&
    'frame/module_domain.f: Failed to allocate grid%aclwupb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwupb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwupb'
  grid%tail_statevars%DataName = 'ACLWUPB'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwupb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwupb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15678,&
    'frame/module_domain.f: Failed to allocate grid%aclwupb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwupbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwupbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15687,&
    'frame/module_domain.f: Failed to allocate grid%aclwupbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwupbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwupbc'
  grid%tail_statevars%DataName = 'ACLWUPBC'
  grid%tail_statevars%Description = 'ACCUMULATED UPWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwupbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwupbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15735,&
    'frame/module_domain.f: Failed to allocate grid%aclwupbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwdnb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwdnb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15744,&
    'frame/module_domain.f: Failed to allocate grid%aclwdnb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwdnb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwdnb'
  grid%tail_statevars%DataName = 'ACLWDNB'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwdnb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwdnb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15792,&
    'frame/module_domain.f: Failed to allocate grid%aclwdnb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'aclwdnbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%aclwdnbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15801,&
    'frame/module_domain.f: Failed to allocate grid%aclwdnbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%aclwdnbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'aclwdnbc'
  grid%tail_statevars%DataName = 'ACLWDNBC'
  grid%tail_statevars%Description = 'ACCUMULATED DOWNWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%aclwdnbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%aclwdnbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15849,&
    'frame/module_domain.f: Failed to allocate grid%aclwdnbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswupt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswupt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15858,&
    'frame/module_domain.f: Failed to allocate grid%i_acswupt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswupt=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswupt'
  grid%tail_statevars%DataName = 'I_ACSWUPT'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswupt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswupt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15906,&
    'frame/module_domain.f: Failed to allocate grid%i_acswupt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswuptc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswuptc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15915,&
    'frame/module_domain.f: Failed to allocate grid%i_acswuptc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswuptc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswuptc'
  grid%tail_statevars%DataName = 'I_ACSWUPTC'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING CLEAR SKY SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswuptc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswuptc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15963,&
    'frame/module_domain.f: Failed to allocate grid%i_acswuptc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswdnt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswdnt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",15972,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdnt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswdnt=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswdnt'
  grid%tail_statevars%DataName = 'I_ACSWDNT'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswdnt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswdnt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16020,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdnt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswdntc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswdntc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16029,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdntc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswdntc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswdntc'
  grid%tail_statevars%DataName = 'I_ACSWDNTC'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswdntc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswdntc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16077,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdntc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswupb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswupb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16086,&
    'frame/module_domain.f: Failed to allocate grid%i_acswupb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswupb=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswupb'
  grid%tail_statevars%DataName = 'I_ACSWUPB'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswupb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswupb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16134,&
    'frame/module_domain.f: Failed to allocate grid%i_acswupb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswupbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswupbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16143,&
    'frame/module_domain.f: Failed to allocate grid%i_acswupbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswupbc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswupbc'
  grid%tail_statevars%DataName = 'I_ACSWUPBC'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswupbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswupbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16191,&
    'frame/module_domain.f: Failed to allocate grid%i_acswupbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswdnb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswdnb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16200,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdnb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswdnb=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswdnb'
  grid%tail_statevars%DataName = 'I_ACSWDNB'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswdnb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswdnb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16248,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdnb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_acswdnbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_acswdnbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16257,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdnbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_acswdnbc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_acswdnbc'
  grid%tail_statevars%DataName = 'I_ACSWDNBC'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_acswdnbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_acswdnbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16305,&
    'frame/module_domain.f: Failed to allocate grid%i_acswdnbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwupt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwupt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16314,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwupt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwupt=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwupt'
  grid%tail_statevars%DataName = 'I_ACLWUPT'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwupt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwupt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16362,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwupt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwuptc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwuptc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16371,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwuptc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwuptc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwuptc'
  grid%tail_statevars%DataName = 'I_ACLWUPTC'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING CLEAR SKY LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwuptc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwuptc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16419,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwuptc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwdnt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwdnt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16428,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdnt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwdnt=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwdnt'
  grid%tail_statevars%DataName = 'I_ACLWDNT'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwdnt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwdnt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16476,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdnt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwdntc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwdntc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16485,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdntc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwdntc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwdntc'
  grid%tail_statevars%DataName = 'I_ACLWDNTC'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING CLEAR SKY LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwdntc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwdntc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16533,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdntc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwupb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwupb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16542,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwupb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwupb=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwupb'
  grid%tail_statevars%DataName = 'I_ACLWUPB'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwupb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwupb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16590,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwupb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwupbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwupbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16599,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwupbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwupbc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwupbc'
  grid%tail_statevars%DataName = 'I_ACLWUPBC'
  grid%tail_statevars%Description = 'BUCKET FOR UPWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwupbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwupbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16647,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwupbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwdnb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwdnb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16656,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdnb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwdnb=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwdnb'
  grid%tail_statevars%DataName = 'I_ACLWDNB'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwdnb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwdnb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16704,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdnb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'i_aclwdnbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%i_aclwdnbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16713,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdnbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%i_aclwdnbc=0
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'i_aclwdnbc'
  grid%tail_statevars%DataName = 'I_ACLWDNBC'
  grid%tail_statevars%Description = 'BUCKET FOR DOWNWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'J m-2'
  grid%tail_statevars%Type = 'i'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%ifield_2d => grid%i_aclwdnbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%i_aclwdnbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16761,&
    'frame/module_domain.f: Failed to allocate grid%i_aclwdnbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swupt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swupt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16770,&
    'frame/module_domain.f: Failed to allocate grid%swupt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swupt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swupt'
  grid%tail_statevars%DataName = 'SWUPT'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swupt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swupt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16818,&
    'frame/module_domain.f: Failed to allocate grid%swupt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swuptc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swuptc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16827,&
    'frame/module_domain.f: Failed to allocate grid%swuptc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swuptc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swuptc'
  grid%tail_statevars%DataName = 'SWUPTC'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING CLEAR SKY SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swuptc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swuptc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16875,&
    'frame/module_domain.f: Failed to allocate grid%swuptc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swdnt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swdnt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16884,&
    'frame/module_domain.f: Failed to allocate grid%swdnt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swdnt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swdnt'
  grid%tail_statevars%DataName = 'SWDNT'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swdnt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swdnt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16932,&
    'frame/module_domain.f: Failed to allocate grid%swdnt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swdntc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swdntc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16941,&
    'frame/module_domain.f: Failed to allocate grid%swdntc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swdntc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swdntc'
  grid%tail_statevars%DataName = 'SWDNTC'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swdntc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swdntc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16989,&
    'frame/module_domain.f: Failed to allocate grid%swdntc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swupb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swupb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",16998,&
    'frame/module_domain.f: Failed to allocate grid%swupb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swupb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swupb'
  grid%tail_statevars%DataName = 'SWUPB'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swupb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swupb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17046,&
    'frame/module_domain.f: Failed to allocate grid%swupb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swupbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swupbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17055,&
    'frame/module_domain.f: Failed to allocate grid%swupbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swupbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swupbc'
  grid%tail_statevars%DataName = 'SWUPBC'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swupbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swupbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17103,&
    'frame/module_domain.f: Failed to allocate grid%swupbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swdnb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swdnb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17112,&
    'frame/module_domain.f: Failed to allocate grid%swdnb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swdnb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swdnb'
  grid%tail_statevars%DataName = 'SWDNB'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swdnb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swdnb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17160,&
    'frame/module_domain.f: Failed to allocate grid%swdnb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swdnbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swdnbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17169,&
    'frame/module_domain.f: Failed to allocate grid%swdnbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swdnbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swdnbc'
  grid%tail_statevars%DataName = 'SWDNBC'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swdnbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swdnbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17217,&
    'frame/module_domain.f: Failed to allocate grid%swdnbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwupt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwupt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17226,&
    'frame/module_domain.f: Failed to allocate grid%lwupt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwupt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwupt'
  grid%tail_statevars%DataName = 'LWUPT'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwupt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwupt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17274,&
    'frame/module_domain.f: Failed to allocate grid%lwupt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwuptc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwuptc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17283,&
    'frame/module_domain.f: Failed to allocate grid%lwuptc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwuptc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwuptc'
  grid%tail_statevars%DataName = 'LWUPTC'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING CLEAR SKY LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwuptc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwuptc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17331,&
    'frame/module_domain.f: Failed to allocate grid%lwuptc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwdnt'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwdnt(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17340,&
    'frame/module_domain.f: Failed to allocate grid%lwdnt(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwdnt=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwdnt'
  grid%tail_statevars%DataName = 'LWDNT'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwdnt
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwdnt(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17388,&
    'frame/module_domain.f: Failed to allocate grid%lwdnt(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwdntc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwdntc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17397,&
    'frame/module_domain.f: Failed to allocate grid%lwdntc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwdntc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwdntc'
  grid%tail_statevars%DataName = 'LWDNTC'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING CLEAR SKY LONGWAVE FLUX AT TOP'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwdntc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwdntc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17445,&
    'frame/module_domain.f: Failed to allocate grid%lwdntc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwupb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwupb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17454,&
    'frame/module_domain.f: Failed to allocate grid%lwupb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwupb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwupb'
  grid%tail_statevars%DataName = 'LWUPB'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwupb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwupb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17502,&
    'frame/module_domain.f: Failed to allocate grid%lwupb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwupbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwupbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17511,&
    'frame/module_domain.f: Failed to allocate grid%lwupbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwupbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwupbc'
  grid%tail_statevars%DataName = 'LWUPBC'
  grid%tail_statevars%Description = 'INSTANTANEOUS UPWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwupbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwupbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17559,&
    'frame/module_domain.f: Failed to allocate grid%lwupbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwdnb'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwdnb(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17568,&
    'frame/module_domain.f: Failed to allocate grid%lwdnb(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwdnb=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwdnb'
  grid%tail_statevars%DataName = 'LWDNB'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwdnb
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwdnb(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17616,&
    'frame/module_domain.f: Failed to allocate grid%lwdnb(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwdnbc'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwdnbc(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17625,&
    'frame/module_domain.f: Failed to allocate grid%lwdnbc(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwdnbc=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwdnbc'
  grid%tail_statevars%DataName = 'LWDNBC'
  grid%tail_statevars%Description = 'INSTANTANEOUS DOWNWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwdnbc
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwdnbc(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17673,&
    'frame/module_domain.f: Failed to allocate grid%lwdnbc(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'swcf').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%swcf(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17682,&
    'frame/module_domain.f: Failed to allocate grid%swcf(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%swcf=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'swcf'
  grid%tail_statevars%DataName = 'SWCF'
  grid%tail_statevars%Description = 'SHORT WAVE CLOUD FORCING AT TOA'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%swcf
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%swcf(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17730,&
    'frame/module_domain.f: Failed to allocate grid%swcf(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'lwcf').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%lwcf(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17739,&
    'frame/module_domain.f: Failed to allocate grid%lwcf(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%lwcf=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'lwcf'
  grid%tail_statevars%DataName = 'LWCF'
  grid%tail_statevars%Description = 'LONG WAVE CLOUD FORCING AT TOA'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%lwcf
  grid%tail_statevars%streams(1) = 0
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%lwcf(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17787,&
    'frame/module_domain.f: Failed to allocate grid%lwcf(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'olr').AND.(.NOT.grid%is_intermediate))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%olr(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17796,&
    'frame/module_domain.f: Failed to allocate grid%olr(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%olr=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'olr'
  grid%tail_statevars%DataName = 'OLR'
  grid%tail_statevars%Description = 'TOA OUTGOING LONG WAVE'
  grid%tail_statevars%Units = 'W m-2'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%olr
  grid%tail_statevars%streams(1) = 1
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%olr(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17844,&
    'frame/module_domain.f: Failed to allocate grid%olr(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xlat'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xlat(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17853,&
    'frame/module_domain.f: Failed to allocate grid%xlat(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xlat=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xlat'
  grid%tail_statevars%DataName = 'XLAT'
  grid%tail_statevars%Description = 'LATITUDE, SOUTH IS NEGATIVE'
  grid%tail_statevars%Units = 'degree_north'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xlat
  grid%tail_statevars%streams(1) = 503316483
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xlat(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17901,&
    'frame/module_domain.f: Failed to allocate grid%xlat(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xlong'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xlong(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17910,&
    'frame/module_domain.f: Failed to allocate grid%xlong(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xlong=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xlong'
  grid%tail_statevars%DataName = 'XLONG'
  grid%tail_statevars%Description = 'LONGITUDE, WEST IS NEGATIVE'
  grid%tail_statevars%Units = 'degree_east'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = ''
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xlong
  grid%tail_statevars%streams(1) = 503316483
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xlong(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17958,&
    'frame/module_domain.f: Failed to allocate grid%xlong(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xlat_u'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xlat_u(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",17967,&
    'frame/module_domain.f: Failed to allocate grid%xlat_u(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xlat_u=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xlat_u'
  grid%tail_statevars%DataName = 'XLAT_U'
  grid%tail_statevars%Description = 'LATITUDE, SOUTH IS NEGATIVE'
  grid%tail_statevars%Units = 'degree_north'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'X'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xlat_u
  grid%tail_statevars%streams(1) = 234881027
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = ide
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( ide, ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east_stag'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xlat_u(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18015,&
    'frame/module_domain.f: Failed to allocate grid%xlat_u(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xlong_u'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xlong_u(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18024,&
    'frame/module_domain.f: Failed to allocate grid%xlong_u(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xlong_u=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xlong_u'
  grid%tail_statevars%DataName = 'XLONG_U'
  grid%tail_statevars%Description = 'LONGITUDE, WEST IS NEGATIVE'
  grid%tail_statevars%Units = 'degree_east'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'X'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xlong_u
  grid%tail_statevars%streams(1) = 234881027
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = ide
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = (jde-1)
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( ide, ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( (jde-1), jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east_stag'
  grid%tail_statevars%dimname2 = 'south_north'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xlong_u(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18072,&
    'frame/module_domain.f: Failed to allocate grid%xlong_u(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xlat_v'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xlat_v(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18081,&
    'frame/module_domain.f: Failed to allocate grid%xlat_v(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xlat_v=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xlat_v'
  grid%tail_statevars%DataName = 'XLAT_V'
  grid%tail_statevars%Description = 'LATITUDE, SOUTH IS NEGATIVE'
  grid%tail_statevars%Units = 'degree_north'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'Y'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xlat_v
  grid%tail_statevars%streams(1) = 234881027
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = jde
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( jde, jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north_stag'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xlat_v(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18129,&
    'frame/module_domain.f: Failed to allocate grid%xlat_v(1,1).  ')
  endif
ENDIF
IF(in_use_for_config(id,'xlong_v'))THEN
  num_bytes_allocated = num_bytes_allocated + &
((((em31)-(sm31)+1))*(((em33)-(sm33)+1))) * 4
  ALLOCATE(grid%xlong_v(sm31:em31,sm33:em33),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18138,&
    'frame/module_domain.f: Failed to allocate grid%xlong_v(sm31:em31,sm33:em33). ')
  endif
  IF ( setinitval .EQ. 1 .OR. setinitval .EQ. 3 ) grid%xlong_v=initial_data_value
  IF (.NOT.grid%is_intermediate) THEN
  ALLOCATE( grid%tail_statevars%next )
  grid%tail_statevars => grid%tail_statevars%next
  NULLIFY( grid%tail_statevars%next )
  grid%tail_statevars%VarName = 'xlong_v'
  grid%tail_statevars%DataName = 'XLONG_V'
  grid%tail_statevars%Description = 'LONGITUDE, WEST IS NEGATIVE'
  grid%tail_statevars%Units = 'degree_east'
  grid%tail_statevars%Type = 'r'
  grid%tail_statevars%ProcOrient = ' '
  grid%tail_statevars%MemoryOrder = 'XY'
  grid%tail_statevars%Stagger = 'Y'
  grid%tail_statevars%Ntl = 0
  grid%tail_statevars%Ndim = 2
  grid%tail_statevars%Restart = .TRUE.
  grid%tail_statevars%scalar_array = .FALSE.
  grid%tail_statevars%rfield_2d => grid%xlong_v
  grid%tail_statevars%streams(1) = 234881027
  grid%tail_statevars%streams(2) = 2097152
  grid%tail_statevars%sd1 = ids
  grid%tail_statevars%ed1 = (ide-1)
  grid%tail_statevars%sd2 = jds
  grid%tail_statevars%ed2 = jde
  grid%tail_statevars%sd3 = 1
  grid%tail_statevars%ed3 = 1
  grid%tail_statevars%sm1 = ims
  grid%tail_statevars%em1 = ime
  grid%tail_statevars%sm2 = jms
  grid%tail_statevars%em2 = jme
  grid%tail_statevars%sm3 = 1
  grid%tail_statevars%em3 = 1
  grid%tail_statevars%sp1 = ips
  grid%tail_statevars%ep1 = MIN( (ide-1), ipe )
  grid%tail_statevars%sp2 = jps
  grid%tail_statevars%ep2 = MIN( jde, jpe )
  grid%tail_statevars%sp3 = 1
  grid%tail_statevars%ep3 = 1
  grid%tail_statevars%dimname1 = 'west_east'
  grid%tail_statevars%dimname2 = 'south_north_stag'
  grid%tail_statevars%dimname3 = ''
  ENDIF
ELSE
  ALLOCATE(grid%xlong_v(1,1),STAT=ierr)
  if (ierr.ne.0) then
    CALL wrf_error_fatal3("<stdin>",18186,&
    'frame/module_domain.f: Failed to allocate grid%xlong_v(1,1).  ')
  endif
ENDIF
   END SUBROUTINE alloc_space_field_core_1
END MODULE module_alloc_space_1
