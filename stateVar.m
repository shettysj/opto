function [m,h]=stateVar(m_prev, h_prev, dt,V, ch_name, ca_conc)

      m = m_prev + (dt*((alpha_m(V,ch_name, ca_conc)*(1-m_prev)) - (beta_m(V,ch_name)*m_prev)));
     
      
      h = h_prev + (dt*((alpha_h(V,ch_name)*(1-h_prev)) - (beta_h(V,ch_name)*h_prev)));





end