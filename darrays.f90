subroutine darrays()
  use params
  deallocate(x)
  deallocate(U)
  deallocate(Umat)
  deallocate(Amat)
  deallocate(Hmat)
  deallocate(Bmat)
  deallocate(Tmat)
  deallocate(psi)
 
  deallocate(IPIV)
  deallocate(WORK)
  deallocate(W)
  deallocate(WORKV)

end subroutine darrays
