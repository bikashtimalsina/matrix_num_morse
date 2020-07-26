subroutine aarrays()
  use params
  allocate(x(num))
  allocate(U(num))
  allocate(Umat(num,num))
  allocate(Amat(num,num))
  allocate(Hmat(num,num))
  allocate(Bmat(num,num))
  allocate(Tmat(num,num))
  allocate(psi(num,num))
  
  allocate(IPIV(num))
  allocate(WORK(num))
  
  allocate(W(num))
  allocate(WORKV(3*num-1))


end subroutine aarrays
