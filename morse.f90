program morse
  use params
  call io()
  call aarrays()
  LDA=num
  LWORK=num
  LWORKV=3*num-1
  Cse = -hbar**2/(2.0d0*m*Lse**2*Ese)  ! schrondinger e	q constant
  dx=(xMax-xMin)/dble(num-1)           ! increment of position
! ======= compute potential well ======
  do i=1, num
    x(i)=xMin+dble(i-1)*dx
    U(i)=U1*(1.0d0-(exp((x0-x(i))/s)-1.0d0)**2)
    write(2,10) x(i), U(i)   ! testing of potential,(passed)
  end do
  close(2)
  10 format(f10.5, f22.15)

! ============================
! Setup the U matrix
! ============================
  dx2=dx*dx
  Umat=0.0d0
  do i=1, num
    Umat(i,i)=U(i)
  end do
 
  Bmat=0.0d0
  do i=1, num
    Bmat(i,i)=10.0d0
  end do

  do i=1, num-1
    Bmat(i,i+1)=1.0d0
    Bmat(i+1,i)=1.0d0
  end do

  Bmat=Bmat/12.0d0


  Amat=0.0d0
  do i=1,num
    Amat(i,i)=-2.0d0
  end do

  do i=1,num-1
    Amat(i,i+1)=1.0d0
    Amat(i+1,i)=1.0d0
  end do

  Amat=Cse*Amat/dx2
  
  
! =============================
! Inversion of matrix B
! ==============================

    
  call DGETRF(num, num, Bmat, LDA, IPIV, INFO)
  call DGETRI(num, Bmat, LDA, IPIV, WORK, LWORK, INFO)
  
  
! ===============================
! set up of K and H matrix
! ===============================
  
  Tmat=matmul(Bmat, Amat)
  Hmat=Tmat+Umat

  call DSYEV('V', 'U', num, Hmat, num, W, WORKV, LWORKV, INFO)
  
  do i=1, num
  if(W(i) .lt. 0) then          ! USE SIMILAR PROCESS TO EXTRACT EIGENVECTOR FROM THE Hmat.
  write(*,12) i, W(i)
  endif
  enddo
  
  close(3)
  close(4)
 
  12 format(i5, f23.15)
! 14 format(10f23.15)
 call darrays()
 
! PROGRAM IS SUCCESSFULLY BUILT. THE DESIRED EIGENVALUES ARE SUCCESSFULLY COMPUTED AND DISPLAYED ON TERMINAL. YOU CAN SEND THEM TO THE eigval.dat AS WELL. BY THE SIMILAR PROCESS
! USED TO EXTRACT EIGENVALUES YOU CAN EXTRACT EIGENVECTOR AS WELL, NORMALIZE IT AND THEN SAVE THE OUTPUT TO eigvector.dat.
end program morse
