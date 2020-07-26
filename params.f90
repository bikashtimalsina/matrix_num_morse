module params
  implicit none
  real(8), parameter :: hbar = 1.0550d-34 ! unit J.S
  real(8), parameter :: e = 1.6020d-19  ! electronic charge C
  real(8), parameter :: m = 9.1090d-31;  ! kg electronic mass
  real(8), parameter :: mp = 1.672520d-27;  ! kg proton mass
  real(8), parameter :: mn = 1.674820d-27; ! kg neutron mass
  real(8), parameter :: esp0 = 8.8540d-12; ! permitivity of free space F/m
  real(8), parameter :: Ese = 1.60d-19; ! Energy scaling factor
  real(8), parameter :: Lse = 1.0d-09; ! length scaling factor
  integer(4) num !=101 disabled here ! mesh size, read from file
  integer(4) n_eigval  ! eigenvalue counter
  real(8) Cse
  real(8) U1, x0, S, xMin, xMax, dx, dx2
  real(8), allocatable :: x(:)
  real(8), allocatable :: U(:), Umat(:,:)
  real(8), allocatable :: Amat(:,:)
  real(8), allocatable :: Hmat(:,:)
  real(8), allocatable :: Bmat(:,:)
  real(8), allocatable :: Tmat(:,:)
  real(8), allocatable :: psi(:,:)

  real(8), allocatable :: IPIV(:)
  real(8), allocatable :: WORK(:)
  
  integer(8) LDA, LWORK, INFO
  
  real(8), allocatable :: W(:)
  real(8), allocatable :: WORKV(:)
  integer(8) LWORKV
  
end module params

