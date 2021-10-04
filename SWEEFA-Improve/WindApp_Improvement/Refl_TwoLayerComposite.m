function [rhoh, rhov, gammav, gammah] = Refl_TwoLayerComposite(eps2, eps3, d, theta1, f)

theta1 = deg2rad(theta1);    

eps1 = 1;    

    lam2 = 1 *20*pi/3*f*sqrt(eps2); % wave number in medium 2 , removed i   

    theta2 = acos((1-(sqrt(eps1)/sqrt(eps2).*sin(theta1)).^2).^(1/2)); 

    theta3 = acos((1-(sqrt(eps1)/sqrt(eps3).*sin(theta1)).^2).^(1/2)); 

    rho12h = (sqrt(eps1).*cos(theta1)-sqrt(eps2).*cos(theta2)) ./ (sqrt(eps1).*cos(theta1) +sqrt(eps2).*cos(theta2));

    rho12v = (sqrt(eps1).*cos(theta2)-sqrt(eps2).*cos(theta1)) ./ (sqrt(eps1).*cos(theta2) + sqrt(eps2)*cos(theta1));

    rho23h = (sqrt(eps2).*cos(theta2)-sqrt(eps3).*cos(theta3)) ./ (sqrt(eps2).*cos(theta2) +sqrt(eps3).*cos(theta3));

    rho23v = (sqrt(eps2).*cos(theta3)-sqrt(eps3).*cos(theta2)) ./ (sqrt(eps2).*cos(theta3) +sqrt(eps3)*cos(theta2));

    rhoh = (rho12h + rho23h.*exp(-2*lam2.*d.*cos(theta2)))./(1 + rho12h.*rho23h.*exp(-2*lam2.*d.*cos(theta2)));

    rhov = (rho12v + rho23v.*exp(-2*lam2.*d.*cos(theta2)))./(1 + rho12v.*rho23v.*exp(-2*lam2.*d.*cos(theta2)));

    gammah = abs(rhoh).^2;

    gammav = abs(rhov).^2;           

  end

