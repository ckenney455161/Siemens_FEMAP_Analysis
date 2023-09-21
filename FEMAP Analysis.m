clc; close all; clear all;

%% MIRACLE PT3 

%% Import - ****MUST output all data calculations
    t_nodes = readtable('results_opt.xlsx', 'Sheet', 'Nodes', "VariableNamingRule", "preserve");
    t_elements = readtable('results_opt.xlsx', 'Sheet', 'Elements', "VariableNamingRule", "preserve");
    t_props = t_elements.Properties.VariableNames;
    t_props = cell2table(t_props);
    t_props_matrix = t_props{:,:};   
    
%% Displacement Table
% Total Displacement
    disp_total_n = t_nodes(:,6);
    disp_total_n = table2array(disp_total_n);
    max_disp_n = max(disp_total_n);

% X, Y, Z Max displacements
    disp_x= t_elements(:,7);
    disp_x = table2array(disp_x);
    max_disp_x = max(disp_x);
    
    disp_y= t_elements(:,8);
    disp_y = table2array(disp_y);
    max_disp_y = max(disp_y);
    
    disp_z= t_elements(:,9);
    disp_z = table2array(disp_z);
    max_disp_z = max(disp_z);
    
% Disp Table
    disp = [max_disp_n; max_disp_x; max_disp_y; max_disp_z];
    
%% Normal Stresses
% X Normal Stresses
    xx = contains(t_props_matrix, "X Normal Stress");
    xstressor = t_props_matrix(any(xx) == contains(t_props_matrix, "X Normal Stress"));
    tx_stress = t_elements(:, xstressor);
    tx_stress_perply = max(tx_stress{:,:});
    tx_stress_max = max(tx_stress_perply);
   
    % Y Normal Stresses
    yy = contains(t_props_matrix, "Y Normal Stress");
    ystressor = t_props_matrix(any(yy) == contains(t_props_matrix, "Y Normal Stress"));
    ty_stress = t_elements(:, ystressor);
    ty_stress_perply = max(ty_stress{:,:});
    ty_stress_max = max(ty_stress_perply);

%% Normal Strain
% X Normal Strain
    xx = contains(t_props_matrix, "X Normal Strain");
    xstrainor = t_props_matrix(any(xx) == contains(t_props_matrix, "X Normal Strain"));
    tx_strain = t_elements(:, xstrainor);
    tx_strain_perply = max(tx_strain{:,:});
    tx_strain_max = max(tx_strain_perply);
    
% Y Normal Strain
    yy = contains(t_props_matrix, "Y Normal Strain");
    ystrainor = t_props_matrix(any(yy) == contains(t_props_matrix, "Y Normal Strain"));
    ty_strain = t_elements(:, ystrainor);
    ty_strain_perply = max(ty_strain{:,:});
    ty_strain_max = max(ty_strain_perply);

%% Shear Stresses
% XY Shear Stress
    xx = contains(t_props_matrix, "XY Shear Stress");
    xstrainor = t_props_matrix(any(xx) == contains(t_props_matrix, "XY Shear Stress"));
    txy_stress = t_elements(:, xstrainor);
    txy_stress_perply = max(txy_stress{:,:});
    txy_stress_max = max(txy_stress_perply);
    
% YZ Shear Stress
    yy = contains(t_props_matrix, "YZ Shear Stress");
    ystrainor = t_props_matrix(any(yy) == contains(t_props_matrix, "YZ Shear Stress"));
    tyz_stress = t_elements(:, ystrainor);
    tyz_stress_perply = max(tyz_stress{:,:});
    tyz_stress_max = max(tyz_stress_perply);
    
% XZ Shear Stress
    yy = contains(t_props_matrix, "YZ Shear Stress");
    ystrainor = t_props_matrix(any(yy) == contains(t_props_matrix, "YZ Shear Stress"));
    txz_stress = t_elements(:, ystrainor);
    txz_stress_perply = max(txz_stress{:,:});
    txz_stress_max = max(txz_stress_perply);
    
%% Shear Strain
% XY Shear Strain
    xx = contains(t_props_matrix, "XY Shear Strain");
    xstrainor = t_props_matrix(any(xx) == contains(t_props_matrix, "XY Shear Strain"));
    txy_strain = t_elements(:, xstrainor);
    txy_strain_perply = max(txy_strain{:,:});
    txy_strain_max = max(txy_strain_perply);
    
% YZ Shear Strain
    yy = contains(t_props_matrix, "YZ Shear Strain");
    ystrainor = t_props_matrix(any(yy) == contains(t_props_matrix, "YZ Shear Strain"));
    tyz_strain = t_elements(:, ystrainor);
    tyz_strain_perply = max(tyz_strain{:,:});
    tyz_strain_max = max(tyz_strain_perply);
    
% XZ Shear Strain
    yy = contains(t_props_matrix, "YZ Shear Strain");
    ystrainor = t_props_matrix(any(yy) == contains(t_props_matrix, "YZ Shear Strain"));
    txz_strain = t_elements(:, ystrainor);
    txz_strain_perply = max(txz_strain{:,:});
    txz_strain_max = max(txz_strain_perply);
    
%% Indexing: Tabling
% rownames1 = ["Max Displacement (m)", "Max X Normal Stress (Pa)", "Max Y Normal Stress (Pa)"];
% rownames2 = ["Max XY Shear Stress (Pa)", "Max YZ Shear Stress (Pa)", "Maz XZ Shear Stress (Pa)"];
% rownames3 = ["Max XY Shear Strain (Pa)", "Max YZ Shear Strain (Pa)", "Maz XZ Shear Strain (Pa)"];

tt = table([max_disp_n; tx_stress_max; ty_stress_max], 'RowNames', {'Max Displacement (m)', 'Max X Normal Stress (Pa)', 'Max Y Normal Stress (Pa)'}, 'VariableNames', {'11m RHIB w/ 6 Plys of CM3610'})
stress_table = table([txy_stress_max; tyz_stress_max; txz_stress_max], 'RowNames', {'Max XY Shear Stress (Pa)', 'Max YZ Shear Stress (Pa)', 'Maz XZ Shear Stress (Pa)'}, 'VariableNames', {'Shear Stresses'})
strain_table = table([txy_strain_max; tyz_strain_max; txz_strain_max], 'RowNames', {'Max XY Shear Strain (Pa)', 'Max YZ Shear Strain (Pa)', 'Maz XZ Shear Strain (Pa)'}, 'VariableNames', {'Shear Strain'})