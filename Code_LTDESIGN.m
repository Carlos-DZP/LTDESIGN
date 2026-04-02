close all;
clear vars;
clc;
%% COVER
disp('========================================================================');
disp('                     TECNOLOGICO NACIONAL DE MEXICO');
disp('                    Instituto Tecnológico de Pachuca');
disp('           Department of Electrical and Electronic Engineering');
disp('                         Power Systems Modeling');
disp('                       Zamora Pérez Carlos Daniel');
disp('                       Pacheco Serrano Julio Noel');
disp('                     Espejel Rivera María Angélica');
disp('                        Ordaz Oliver Mario Oscar');
disp('             "LTDESIGN: A MATLAB-based open-source toolbox');
disp('            for parametric design of long transmission lines"');
disp('========================================================================');

%% 1. DATA TABLES
cond_names = {'Waxwing', 'Partridge', 'Ostrich', 'Merlin', 'Linnet', 'Oriole', 'Chickadee', 'Ibis', 'Pelican', 'Flicker', 'Hawk', 'Hen', 'Osprey', 'Parakeet', 'Dove', 'Rook', 'Grosbeak', 'Drake', 'Tern', 'Rail', 'Cardinal', 'Ortolan', 'Bluejay', 'Finch', 'Bittern', 'Pheasant', 'Bobolink', 'Plover', 'Lapwing', 'Falcon', 'Bluebird'};
 
Racsr = [0.3831 0.3792 0.3372 0.3037 0.3006 0.2987 0.2572 0.2551 0.2148 0.2134 0.2120 0.2107 0.1843 0.1832 0.1826 0.1603 0.1596 0.1284 0.1302 0.1092 0.1082 0.1011 0.0941 0.0937 0.0832 0.0821 0.0746 0.0735 0.0678 0.0667 0.0515];

xaacsr = [0.476 0.465 0.458 0.462 0.451 0.445 0.452 0.441 0.441 0.432 0.430 0.424 0.432 0.423 0.420 0.415 0.412 0.399 0.406 0.395 0.390 0.390 0.386 0.380 0.378 0.372 0.371 0.365 0.364 0.358 0.344];

xcacsr = [0.1090 0.1074 0.1057 0.1055 0.1040 0.1032 0.1031 0.1015 0.1004 0.0992 0.0988 0.0980 0.0981 0.0969 0.0965 0.0950 0.0946 0.0912 0.0925 0.0897 0.0890 0.0885 0.0874 0.0866 0.0855 0.0847 0.0837 0.0829 0.0822 0.0814 0.0776];

xc1_arr = [0 0.0206 0.0326 0.0411 0.0478 0.0532 0.0577 0.0617 0.0652 0.0683 0.0712 0.0737 0.0761 0.0783 0.0803 0.0823 0.0841 0.0858 0.0874 0.0889 0.0903 0.0917 0.0930 0.0943 0.0955 0.0967 0.0978 0.0989 0.0999 0.1009 0.1019 0.1028 0.1037 0.1046 0.1055 0.1063 0.1071 0.1079 0.1087 0.1094 0.1102 0.1109 0.1116 0.1123 0.1129 0.1136 0.1142 0.1149 0.1155];

xd1_arr = [0 0.0841 0.1333 0.1682 0.1953 0.2174 0.2361 0.2523 0.2666 0.2794 0.2911 0.3015 0.3112 0.3202 0.3286 0.3364 0.3438 0.3507 0.3573 0.3635 0.3694 0.3751 0.3805 0.3856 0.3906 0.3953 0.3999 0.4043 0.4086 0.4127 0.4167 0.4205 0.4243 0.4279 0.4314 0.4348 0.4382 0.4414 0.4445 0.4476 0.4506 0.4535 0.4564 0.4592 0.4619 0.4646 0.4672 0.4697 0.4722];

%% 2. BASE DATA INPUT
disp('--- LAUNCHING MODERN PARAMETER SETUP GUIDE');

appFig = uifigure('Name', 'Transmission Line Model Setup', 'Position', [500, 300, 480, 500], 'Color', '#F7F9FC');
appFig.WindowStyle = 'modal';

gridLayout = uigridlayout(appFig, [9, 2]);
gridLayout.RowHeight = {50, 35, 35, 35, 35, 35, 35, 35, 60};
gridLayout.ColumnWidth = {'1.5x', '1x'};
gridLayout.BackgroundColor = '#F7F9FC';

titleLabel = uilabel(gridLayout, 'Text', 'System Base Parameters', 'FontSize', 18, 'FontWeight', 'bold', 'FontColor', '#1A2A3A', 'HorizontalAlignment', 'center');
titleLabel.Layout.Column = [1 2];

uilabel(gridLayout, 'Text', 'Transmission line length [miles]:', 'FontWeight', 'bold', 'FontSize', 12);
editL0 = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w'); % Default value added for ease

uilabel(gridLayout, 'Text', 'Phase spacing A-B [ft]:', 'FontWeight', 'bold', 'FontSize', 12);
editDab = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w');

uilabel(gridLayout, 'Text', 'Phase spacing B-C [ft]:', 'FontWeight', 'bold', 'FontSize', 12);
editDbc = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w');

uilabel(gridLayout, 'Text', 'Phase spacing C-A [ft]:', 'FontWeight', 'bold', 'FontSize', 12);
editDca = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w');

uilabel(gridLayout, 'Text', 'Receiving-end voltage L-L [V]:', 'FontWeight', 'bold', 'FontSize', 12);
editVr = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w');

uilabel(gridLayout, 'Text', 'Load demand 3-Phase [W]:', 'FontWeight', 'bold', 'FontSize', 12);
editLoad = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w');

uilabel(gridLayout, 'Text', 'Power factor [0-1]:', 'FontWeight', 'bold', 'FontSize', 12);
editFP = uieditfield(gridLayout, 'numeric', 'Value', 0, 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'w');

runBtn = uibutton(gridLayout, 'Text', 'PRESS HERE TO START SIMULATION', 'FontSize', 14, 'FontWeight', 'bold', 'BackgroundColor', '#004C99', 'FontColor', 'w');
runBtn.Layout.Column = [1 2];
runBtn.ButtonPushedFcn = @(btn,event) uiresume(appFig);

uiwait(appFig);

if ~isvalid(appFig)
    error('Configuration was closed by the user. Execution aborted to prevent errors.');
end

l0 = editL0.Value;
Dab_0 = editDab.Value;
Dbc_0 = editDbc.Value;
Dca_0 = editDca.Value;
Vr = editVr.Value;
Load = editLoad.Value;
FP = editFP.Value;

delete(appFig);

Vr_fase = Vr/sqrt(3);
Ir_mag = Load/(sqrt(3)*Vr*FP);
Ir_ang = -acos(FP);
Ir = Ir_mag*exp(1i*Ir_ang);
recep = [Vr_fase; Ir];

fprintf('Data successfully loaded via Modern App GUI.\n');
fprintf('Length: %.2f mi | Voltage: %.2f kV | Load: %.2f MW\n', l0, Vr/1000, Load/1e6);
disp('-----------------------------------');

%% 3. FASE I: SEARCH FOR OPTIMAL LEADWIRE
disp(' ');
disp('==============================================================');
disp('   PHASE 1: SEARCHING ACSR CONDUCTORS (Target: 15% - 20% Reg)');
disp('==============================================================');

DMG_0 = (Dab_0 * Dbc_0 * Dca_0)^(1/3);
Ds_0 = max(1, min(49, round(DMG_0)));
xc1_0 = xc1_arr(Ds_0);
xd1_0 = xd1_arr(Ds_0);

reg_leadwire = zeros(1, 31); 

for mat = 1:31
    R = Racsr(mat); xa = xaacsr(mat); xc = xcacsr(mat);
    XL = xa + xd1_0; Z = R + 1i*XL; Y = 1i*(1/(xc+xc1_0))*1e-6;
    A = [0 Z; Y 0];
    [P, LAmbda_num] = eig(A);
    Diag_e = [exp(LAmbda_num(1,1)*l0) 0; 0 exp(LAmbda_num(2,2)*l0)];
    MatABCD_num = P * Diag_e / P;
    
    send = MatABCD_num * recep;
    Vs_m = abs(send(1));
    reg_leadwire(mat) = (((Vs_m/abs(MatABCD_num(1,1))) - Vr_fase)/Vr_fase) * 100;
    
    if reg_leadwire(mat) >= 15 && reg_leadwire(mat) <= 20
        fprintf('ACSR %2d (%-9s) ---> Voltage Regulation = %6.3f %%\n', mat, cond_names{mat}, reg_leadwire(mat));
    end
end

[~, idx_orders] = sort(abs(reg_leadwire));
best_global_wire = idx_orders(1);

figure('Name', 'Phase 1: Conductor Analysis', 'Color', 'w', 'Position', [50, 400, 800, 400]);
hold on; grid on; set(gca, 'GridAlpha', 0.3, 'LineWidth', 1.2); box on;
fill([0 32 32 0], [15 15 20 20], [0.1 0.8 0.3], 'FaceAlpha', 0.15, 'EdgeColor', 'none', 'HandleVisibility', 'off');

plot(1:31, reg_leadwire, '-o', 'LineWidth', 2, 'Color', [0.15 0.25 0.45], 'MarkerFaceColor', 'w', 'MarkerSize', 6, 'DisplayName', 'Regulation Curve');
yline(15, '--', 'Min (15%)', 'Color', [0.1 0.6 0.1], 'LineWidth', 2.5, 'LabelHorizontalAlignment', 'left', 'HandleVisibility', 'off');
yline(20, '--', 'Max (20%)', 'Color', [0.8 0.2 0.2], 'LineWidth', 2.5, 'LabelHorizontalAlignment', 'left', 'HandleVisibility', 'off');

idx_valid = find(reg_leadwire >= 15 & reg_leadwire <= 20);
if ~isempty(idx_valid)
    scatter(idx_valid, reg_leadwire(idx_valid), 80, 'filled', 'MarkerFaceColor', [0.2 0.8 0.2], 'MarkerEdgeColor', 'k', 'DisplayName', 'Optimal Range');
end
scatter(best_global_wire, reg_leadwire(best_global_wire), 250, 'p', 'filled', 'MarkerFaceColor', [1 0.8 0], 'MarkerEdgeColor', 'k', 'LineWidth', 1.5, 'DisplayName', 'Absolute Best');

title('Voltage Regulation per ACSR Conductor Type', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Conductor Type', 'FontSize', 12, 'FontWeight', 'bold'); 
ylabel('Voltage Regulation [%]', 'FontSize', 12, 'FontWeight', 'bold');
xticks(1:31); xticklabels(cond_names); xtickangle(45); xlim([0 32]); legend('Location', 'northeast');

%% 4. PHASE II: CONDUCTOR SELECTION AND SPACING ANALYSIS

disp('--- LAUNCHING LEADWIRE SELECTION GUIDE ---');

appFigCond = uifigure('Name', 'Lead Wire Selection', 'Position', [550, 450, 400, 250], 'Color', '#F7F9FC');
appFigCond.WindowStyle = 'modal';

gridCond = uigridlayout(appFigCond, [4, 1]);
gridCond.RowHeight = {40, 30, 40, 50};
gridCond.BackgroundColor = '#F7F9FC';

uilabel(gridCond, 'Text', 'Select Leadwire for Deep Analysis', 'FontSize', 16, 'FontWeight', 'bold', 'FontColor', '#1A2A3A', 'HorizontalAlignment', 'center');

uilabel(gridCond, 'Text', sprintf('Recommended Best Overall: %s', upper(cond_names{best_global_wire})), 'FontSize', 12, 'FontColor', '#004C99', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

dropCond = uidropdown(gridCond, 'Items', cond_names, 'ItemsData', 1:31, 'Value', best_global_wire, 'FontSize', 14, 'BackgroundColor', 'w');

btnCond = uibutton(gridCond, 'Text', 'ANALYZE LEADWIRE', 'FontSize', 14, 'FontWeight', 'bold', 'BackgroundColor', '#004C99', 'FontColor', 'w');
btnCond.ButtonPushedFcn = @(btn,event) uiresume(appFigCond);

uiwait(appFigCond);

if ~isvalid(appFigCond)
    error('Lead Wire selection was canceled. Execution aborted.');
end

sel_mat = dropCond.Value;
delete(appFigCond);

best_mat = best_global_wire;
lbl_mejor = 'Best Overall';
if sel_mat == best_mat
    best_mat = idx_orders(2);
    lbl_mejor = 'Second Best';
end

R_sel = Racsr(sel_mat); xa_sel = xaacsr(sel_mat); xc_sel = xcacsr(sel_mat);
R_best = Racsr(best_mat); xa_best = xaacsr(best_mat); xc_best = xcacsr(best_mat);

disp(' ');
fprintf('SEARCHING PHASE SPACING FOR %s AND %s\n', upper(cond_names{sel_mat}), upper(cond_names{best_mat}));

D_vals = 5:120;
reg_spacing_sel = zeros(size(D_vals));
reg_spacing_best = zeros(size(D_vals));

for idx = 1:length(D_vals)
    D = D_vals(idx);
    Ds_tmp = max(1, min(49, round((D * D * (2*D))^(1/3))));
    xc1_t = xc1_arr(Ds_tmp); xd1_t = xd1_arr(Ds_tmp);
    
    XL_sel = xa_sel + xd1_t; Z_sel = R_sel + 1i*XL_sel; Y_sel = 1i*(1/(xc_sel+xc1_t))*1e-6;
    A_sel = [0 Z_sel; Y_sel 0];
    [P_sel, L_sel] = eig(A_sel);
    MatABCD_sel = P_sel * diag([exp(L_sel(1,1)*l0), exp(L_sel(2,2)*l0)]) / P_sel;
    send_sel = MatABCD_sel * recep;
    reg_spacing_sel(idx) = (((abs(send_sel(1))/abs(MatABCD_sel(1,1))) - Vr_fase)/Vr_fase) * 100;
    
    XL_best = xa_best + xd1_t; Z_best = R_best + 1i*XL_best; Y_best = 1i*(1/(xc_best+xc1_t))*1e-6;
    A_best = [0 Z_best; Y_best 0];
    [P_best, L_best] = eig(A_best);
    MatABCD_best = P_best * diag([exp(L_best(1,1)*l0), exp(L_best(2,2)*l0)]) / P_best;
    send_best = MatABCD_best * recep;
    reg_spacing_best(idx) = (((abs(send_best(1))/abs(MatABCD_best(1,1))) - Vr_fase)/Vr_fase) * 100;
end

c_sel = [0.4 0.1 0.8];    
c_best = [1.0 0.4 0.0];   
leyenda_sel = sprintf('Selected: %s', cond_names{sel_mat});
leyenda_best = sprintf('%s: %s', lbl_mejor, cond_names{best_mat});

figure('Name', 'Phase 2: Spacing Analysis', 'Color', 'w', 'Position', [870, 400, 800, 400]);
hold on; grid on; set(gca, 'GridAlpha', 0.3, 'LineWidth', 1.2); box on;
fill([0 125 125 0], [15 15 20 20], [0.1 0.8 0.3], 'FaceAlpha', 0.15, 'EdgeColor', 'none', 'HandleVisibility', 'off');

plot(D_vals, reg_spacing_sel, '-', 'LineWidth', 2.5, 'Color', c_sel, 'DisplayName', leyenda_sel);
plot(D_vals, reg_spacing_best, '--', 'LineWidth', 2.5, 'Color', c_best, 'DisplayName', leyenda_best);

yline(15, '--', 'Min (15%)', 'Color', [0.1 0.6 0.1], 'LineWidth', 2.5, 'HandleVisibility', 'off');
yline(20, '--', 'Max (20%)', 'Color', [0.8 0.2 0.2], 'LineWidth', 2.5, 'HandleVisibility', 'off');

title('Voltage Regulation vs Phase Spacing', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Phase Spacing D [ft]', 'FontSize', 12, 'FontWeight', 'bold'); 
ylabel('Voltage Regulation [%]', 'FontSize', 12, 'FontWeight', 'bold');
xlim([5 120]); legend('Location', 'northeast', 'FontSize', 10);

%% GENERAL EXECUTION CONFIGURATION (PHASES III, IV, V AND VI)
disp('--- LAUNCHING ANALYSIS EXECUTION GUIDE ---');

appFigRun = uifigure('Name', 'Analysis Execution Settings', 'Position', [550, 350, 450, 400], 'Color', '#F7F9FC');
appFigRun.WindowStyle = 'modal';

gridRun = uigridlayout(appFigRun, [6, 2]);
gridRun.RowHeight = {40, 50, 50, 50, 50, 60};
gridRun.ColumnWidth = {'1.5x', '1x'};
gridRun.BackgroundColor = '#F7F9FC';

lblTitleRun = uilabel(gridRun, 'Text', 'Execution Settings', 'FontSize', 16, 'FontWeight', 'bold', 'FontColor', '#1A2A3A', 'HorizontalAlignment', 'center');
lblTitleRun.Layout.Column = [1 2];

uilabel(gridRun, 'Text', 'Matrix Evaluation Method:', 'FontWeight', 'bold', 'FontSize', 12);
dropMethod = uidropdown(gridRun, 'Items', {'Cayley-Hamilton (Optimized)', 'Similarity (SVD)'}, 'ItemsData', [1, 2], 'Value', 1, 'FontSize', 12, 'BackgroundColor', 'w');

uilabel(gridRun, 'Text', 'Run Transient Dynamics?', 'FontWeight', 'bold', 'FontSize', 12);
switchTrans = uiswitch(gridRun, 'slider', 'Items', {'Skip', 'Run'}, 'ItemsData', [0, 1], 'Value', 1, 'FontWeight', 'bold');

uilabel(gridRun, 'Text', 'Export PDF Report?', 'FontWeight', 'bold', 'FontSize', 12);
switchPDF = uiswitch(gridRun, 'slider', 'Items', {'Skip', 'Export'}, 'ItemsData', [0, 1], 'Value', 1, 'FontWeight', 'bold');

uilabel(gridRun, 'Text', 'Show 3D Catenary Model?', 'FontWeight', 'bold', 'FontSize', 12);
switch3D = uiswitch(gridRun, 'slider', 'Items', {'Skip', 'Render'}, 'ItemsData', [0, 1], 'Value', 1, 'FontWeight', 'bold');

btnRun = uibutton(gridRun, 'Text', 'EXECUTE ANALYSIS', 'FontSize', 14, 'FontWeight', 'bold', 'BackgroundColor', '#004C99', 'FontColor', 'w');
btnRun.Layout.Column = [1 2];
btnRun.ButtonPushedFcn = @(btn,event) uiresume(appFigRun);

uiwait(appFigRun);

if ~isvalid(appFigRun)
    error('Execution settings canceled. Analysis aborted.');
end

metodo_sol = dropMethod.Value;
run_transient = switchTrans.Value;
save_pdf = switchPDF.Value;
show_3d = switch3D.Value;

delete(appFigRun);

%% 5. PHASE III: PARAMETRIC AND BENCHMARK ANALYSIS (10,000 ITERATIONS)
disp(' ');
disp('==============================================================');
disp('   PHASE 3: BENCHMARK ANALYSIS (10,000 ITERATIONS)');
disp('==============================================================');
disp('Configuring sweep: 10,000 steps of 0.1 miles (Final length: 1,000 miles)...');

pass_mi = 0.1;
num_iterations = 10000;
Lvec = pass_mi : pass_mi : (num_iterations * pass_mi);
nL = length(Lvec);

% Memory pre-allocation (Initially filled with zeros)
Reg_vec = zeros(2, nL);
Vl_vec = zeros(2, nL);
Is_vec = zeros(2, nL);
P_vec = zeros(2, nL);
leadwire_analysis = [sel_mat, best_mat];

for idx_c = 1:2
    c_actual = leadwire_analysis(idx_c);
    R_c = Racsr(c_actual); xa_c = xaacsr(c_actual); xc_c = xcacsr(c_actual);
    
    XL_c = xa_c + xd1_0; Z_c = R_c + 1i*XL_c; Y_c = 1i*(1/(xc_c+xc1_0))*1e-6;
    A_c = [0 Z_c; Y_c 0];
    
    [P_c, LAmbda_c] = eig(A_c);
    eig1 = LAmbda_c(1,1); eig2 = LAmbda_c(2,2);
    H = [1 eig1; 1 eig2];
    
    % --- BENCHMARK IS ONLY PERFORMED FOR CONDUCTOR 1 TO MEASURE TIME ---
    if idx_c == 1
        fprintf('\n--- STARTING PERFORMANCE TEST FOR SELECTED CONDUCTOR ---\n');
        
        % BENCHMARK 1: CAYLEY-HAMILTON
        tic;
        for k_bench = 1:nL
            l_val = Lvec(k_bench);
            elbt = [exp(eig1*l_val); exp(eig2*l_val)];
            Beta = H \ elbt; 
            MatABCD_CH = Beta(1)*eye(2) + Beta(2)*A_c;
        end
        tiempo_CH = toc;
        
        % BENCHMARK 2: SVD / SIMILARITY MATRIX
        tic;
        for k_bench = 1:nL
            l_val = Lvec(k_bench);
            Diag_e = [exp(eig1*l_val) 0; 0 exp(eig2*l_val)];
            MatABCD_SVD = P_c * Diag_e / P_c;
        end
        tiempo_SVD = toc;
        
        fprintf('-> Execution time (10,000 cycles) Cayley-Hamilton : %.5f seconds\n', tiempo_CH);
        fprintf('-> Execution time (10,000 cycles) Similarity (SVD) : %.5f seconds\n', tiempo_SVD);
        if tiempo_CH < tiempo_SVD
            disp('   [Performance winner: Cayley-Hamilton]');
        else
            disp('   [Performance winner: Similarity (SVD)]');
        end
    end
    
    % --- ACTUAL DATA GENERATION FOR GRAPHS ---
    % IMPORTANT! This "for" loop fills the arrays point by point.
    for k = 1:nL
        l_val = Lvec(k);
        Diag_e = [exp(eig1*l_val) 0; 0 exp(eig2*l_val)];
        MatABCD = P_c * Diag_e / P_c;
        
        send = MatABCD*recep;
        Vs = send(1,1); Is = send(2,1);

        Vsm = abs(Vs); Ism = abs(Is);
        fp = cos(angle(Vs) - angle(Is));

        % Saving the data at each position 'k'
        Vl_vec(idx_c, k) = sqrt(3)*Vsm;
        P_vec(idx_c, k) = sqrt(3)*(sqrt(3)*Vsm)*Ism*fp;
        Is_vec(idx_c, k) = Ism;
        Reg_vec(idx_c, k) = (((Vsm/abs(MatABCD(1,1)))-Vr_fase)/Vr_fase)*100;
    end
end
disp('--------------------------------------------------------------');


%% 6. COMPARATIVE MULTIPANEL GRAPHS (PHASE 3)
mainFig = uifigure('Name', 'Phase 3: Comparative Performance Analysis', 'Color', '#F7F9FC', 'Position', [200, 50, 1000, 750]);

mainGrid = uigridlayout(mainFig, [2, 1]);
mainGrid.RowHeight = {'1x', 50};
mainGrid.Padding = [10 10 10 10];
mainGrid.BackgroundColor = '#F7F9FC';

plotPanel = uipanel(mainGrid, 'Title', sprintf('Comparative Parametric Analysis (Base L = %d mi) | Method: %d', l0, metodo_sol), 'FontWeight', 'bold', 'FontSize', 16, 'BackgroundColor', '#F7F9FC');
plotPanel.Layout.Row = 1;

plotGrid = uigridlayout(plotPanel, [2, 2]);
plotGrid.Padding = [15 15 15 15];
plotGrid.BackgroundColor = '#F7F9FC';

signaturePanel = uipanel(mainGrid, 'BackgroundColor', '#1A2A3A', 'BorderType', 'none');
signaturePanel.Layout.Row = 2;

signGrid = uigridlayout(signaturePanel, [1, 1]);
signGrid.Padding = [10 0 10 0];
signGrid.BackgroundColor = '#1A2A3A';

uilabel(signGrid, 'Text', 'Analysis Elaborated & Programmed by: C.D. Zamora-Pérez, J.N. Pacheco-Serrano, M.A. Espejel-Rivera, M.O. Ordaz-Oliver', 'FontSize', 12, 'FontWeight', 'bold', 'FontColor', 'w', 'HorizontalAlignment', 'center');

opt_ax = {'GridAlpha', 0.3, 'LineWidth', 1.2, 'FontSize', 10, 'Box', 'on', 'Parent', plotGrid};

% --- Calculate the index for the nominal length l0 ---
idx_base = round(l0 / pass_mi); 
if idx_base == 0 || idx_base > nL
    idx_base = 1; % Failsafe in case l0 is out of bounds
end

% --- Subplot 1: Voltage Regulation ---
ax1 = uiaxes(opt_ax{:}); ax1.Layout.Row = 1; ax1.Layout.Column = 1; hold(ax1, 'on'); grid(ax1, 'on');
plot(ax1, Lvec, Reg_vec(1,:), '-', 'Color', c_sel, 'LineWidth', 2.5, 'DisplayName', leyenda_sel);
plot(ax1, Lvec, Reg_vec(2,:), '--', 'Color', c_best, 'LineWidth', 2.5, 'DisplayName', leyenda_best);
scatter(ax1, Lvec(idx_base), Reg_vec(1, idx_base), 100, 'h', 'filled', 'MarkerFaceColor', c_sel, 'MarkerEdgeColor', 'k', 'HandleVisibility', 'off');
scatter(ax1, Lvec(idx_base), Reg_vec(2, idx_base), 100, 'h', 'filled', 'MarkerFaceColor', c_best, 'MarkerEdgeColor', 'k', 'HandleVisibility', 'off');
xlabel(ax1, 'Line Length [mi]', 'FontWeight', 'bold'); ylabel(ax1, 'Voltage Reg [%]', 'FontWeight', 'bold');
title(ax1, 'Voltage Regulation vs Length', 'Color', '#2C3E50'); legend(ax1, 'Location', 'best');

% --- Subplot 2: Sending Voltage ---
ax2 = uiaxes(opt_ax{:}); ax2.Layout.Row = 1; ax2.Layout.Column = 2; hold(ax2, 'on'); grid(ax2, 'on');
plot(ax2, Lvec, Vl_vec(1,:), '-', 'Color', c_sel, 'LineWidth', 2.5);
plot(ax2, Lvec, Vl_vec(2,:), '--', 'Color', c_best, 'LineWidth', 2.5);
scatter(ax2, Lvec(idx_base), Vl_vec(1, idx_base), 100, 'h', 'filled', 'MarkerFaceColor', c_sel, 'MarkerEdgeColor', 'k');
scatter(ax2, Lvec(idx_base), Vl_vec(2, idx_base), 100, 'h', 'filled', 'MarkerFaceColor', c_best, 'MarkerEdgeColor', 'k');
xlabel(ax2, 'Line Length [mi]', 'FontWeight', 'bold'); ylabel(ax2, 'Sending Voltage [V]', 'FontWeight', 'bold');
title(ax2, 'Sending Voltage vs Length', 'Color', '#2C3E50');

% --- Subplot 3: Sending Current ---
ax3 = uiaxes(opt_ax{:}); ax3.Layout.Row = 2; ax3.Layout.Column = 1; hold(ax3, 'on'); grid(ax3, 'on');
plot(ax3, Lvec, Is_vec(1,:), '-', 'Color', c_sel, 'LineWidth', 2.5);
plot(ax3, Lvec, Is_vec(2,:), '--', 'Color', c_best, 'LineWidth', 2.5);
scatter(ax3, Lvec(idx_base), Is_vec(1, idx_base), 100, 'h', 'filled', 'MarkerFaceColor', c_sel, 'MarkerEdgeColor', 'k');
scatter(ax3, Lvec(idx_base), Is_vec(2, idx_base), 100, 'h', 'filled', 'MarkerFaceColor', c_best, 'MarkerEdgeColor', 'k');
xlabel(ax3, 'Line Length [mi]', 'FontWeight', 'bold'); ylabel(ax3, 'Sending Current [A]', 'FontWeight', 'bold');
title(ax3, 'Sending Current vs Length', 'Color', '#2C3E50');

% --- Subplot 4: Sending Real Power ---
ax4 = uiaxes(opt_ax{:}); ax4.Layout.Row = 2; ax4.Layout.Column = 2; hold(ax4, 'on'); grid(ax4, 'on');
plot(ax4, Lvec, P_vec(1,:)/1e6, '-', 'Color', c_sel, 'LineWidth', 2.5);
plot(ax4, Lvec, P_vec(2,:)/1e6, '--', 'Color', c_best, 'LineWidth', 2.5);
scatter(ax4, Lvec(idx_base), P_vec(1, idx_base)/1e6, 100, 'h', 'filled', 'MarkerFaceColor', c_sel, 'MarkerEdgeColor', 'k');
scatter(ax4, Lvec(idx_base), P_vec(2, idx_base)/1e6, 100, 'h', 'filled', 'MarkerFaceColor', c_best, 'MarkerEdgeColor', 'k');
xlabel(ax4, 'Line Length [mi]', 'FontWeight', 'bold'); ylabel(ax4, 'Sending Power [MW]', 'FontWeight', 'bold');
title(ax4, 'Sending Real Power vs Length', 'Color', '#2C3E50');

%% 7. PHASE IV: TRANSIENT POWER DYNAMICS (ENERGIZATION)
if run_transient == 1
    disp(' ');
    disp('==============================================================');
    disp('   PHASE 4: TRANSIENT POWER DYNAMICS (ENERGIZATION)');
    disp('==============================================================');
    disp('Modeling transient response using State-Space representation of a Pi-section...');

    f = 60;
    w = 2*pi*f;

    R_tot = R_sel * l0;
    L_tot = imag(Z_sel) / w * l0; 
    C_tot = imag(Y_sel) / w * l0;

    C_R = C_tot / 2; 

    P_fase = Load / 3;
    R_load = Vr_fase^2 / P_fase;

    A_sys = [-R_tot/L_tot, -1/L_tot; 1/C_R, -1/(R_load*C_R)];
    B_sys = [1/L_tot; 0];
    C_sys = [1 0; 0 1]; 
    D_sys = [0; 0];

    sys_line = ss(A_sys, B_sys, C_sys, D_sys);

    t_sim = linspace(0, 6*(1/f), 3000);

    V_max = abs(send(1)) * sqrt(2);
    theta_v = angle(send(1));
    Vs_t = V_max * sin(w * t_sim + theta_v);

    [y_sim, t_out, ~] = lsim(sys_line, Vs_t, t_sim);

IL_t = y_sim(:, 1);
    VR_t = y_sim(:, 2);

    %We force Vs_t to be a column vector to avoid matrix expansion    
    Vs_t_col = Vs_t(:); 
    VR_t_col = VR_t(:);

    % Now we multiply Column x Column = Column Vector (3000x1)
    P_send_t = (Vs_t_col .* IL_t) * 3 / 1e6;     
    P_rec_t  = (VR_t_col.^2 / R_load) * 3 / 1e6;

    figure('Name', 'Phase 4: Transient Power Response', 'Color', '#F7F9FC', 'Position', [300, 150, 900, 650]);
    sgtitle(sprintf('Transient Dynamics at Line Energization\nConductor: %s | Length: %d mi', upper(cond_names{sel_mat}), l0), 'FontSize', 15, 'FontWeight', 'bold', 'Color', '#1A2A3A');

    subplot(2,1,1); hold on; grid on; set(gca, 'GridAlpha', 0.3, 'LineWidth', 1.2, 'FontSize', 11, 'Box', 'on');
    yyaxis left
    plot(t_out*1000, Vs_t/1000, '-', 'Color', [0.15 0.35 0.65], 'LineWidth', 2, 'DisplayName', 'Sending Voltage (Vs)');
    plot(t_out*1000, VR_t/1000, '--', 'Color', [0.85 0.3 0.1], 'LineWidth', 2, 'DisplayName', 'Receiving Voltage (Vr)');
    ylabel('Voltage [kV]', 'FontWeight', 'bold');

    yyaxis right
    plot(t_out*1000, IL_t, '-', 'Color', [0.1 0.6 0.3], 'LineWidth', 1.5, 'DisplayName', 'Line Current (IL)');
    ylabel('Current [A]', 'FontWeight', 'bold', 'Color', [0.1 0.6 0.3]);
    set(gca, 'YColor', [0.1 0.6 0.3]);

    xlabel('Time [ms]', 'FontWeight', 'bold');
    title('Instantaneous Voltage and Current Behavior (First 6 Cycles)', 'Color', '#2C3E50');
    legend('Location', 'northeast');

    subplot(2,1,2); hold on; grid on; set(gca, 'GridAlpha', 0.3, 'LineWidth', 1.2, 'FontSize', 11, 'Box', 'on');
    plot(t_out*1000, P_send_t, '-', 'Color', c_sel, 'LineWidth', 2.5, 'DisplayName', 'Instantaneous Sending Power');
    plot(t_out*1000, P_rec_t, '--', 'Color', c_best, 'LineWidth', 2.5, 'DisplayName', 'Instantaneous Receiving Power');

    yline(Load/1e6, 'k:', 'Nominal Load Demand', 'LineWidth', 2, 'LabelVerticalAlignment', 'bottom', 'HandleVisibility', 'off');

    xlabel('Time [ms]', 'FontWeight', 'bold');
    ylabel('Power [MW]', 'FontWeight', 'bold');
    title('Transient Power Flow vs Time', 'Color', '#2C3E50');
    legend('Location', 'northeast');

    disp('--> Transient Analysis Graphs Generated Successfully.');
end

%% 8. FASE V: PHASE V: GENERATION OF TEXT AND PDF REPORT (DATASHEET)
if save_pdf == 1
    disp(' ');
    disp('==============================================================');
    disp('   PHASE 5: DATA EXTRACTION & PDF REPORT GENERATION');
    disp('==============================================================');
    disp('Creating Datasheet...');

    name_datasheet_pdf = sprintf('DATASHEET_%s.pdf', upper(cond_names{sel_mat}));

    % 1. Create a letter paper
    figReport = figure('Name', 'DATASHEET', 'Color', 'w', 'Position', [100, 100, 850, 1100], 'Visible', 'off');
    axRep = axes('Position', [0 0 1 1], 'Visible', 'off');
    hold(axRep, 'on');
    xlim(axRep, [0 10]); ylim(axRep, [0 10]); % Position text

    % --- HEADER ---
    text(5, 9.5, 'DATASHEET - LTDESIGN', 'FontSize', 15, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'Color', '#1A2A3A');
    text(5, 9.2, sprintf('Analysis Date: %s', datestr(now, 'dd-mmm-yyyy HH:MM')), 'FontSize', 10, 'HorizontalAlignment', 'center');
    text(5, 9.0, 'Designers: C.D. Zamora-Pérez, J.N. Pacheco-Serrano, M.A. Espejel-Rivera, M.O. Ordaz Oliver', 'FontSize', 12, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
    plot([1 9], [8.8 8.8], 'k-', 'LineWidth', 2);

    % --- SECCIÓN 1: DATA BASE ---
    y_pos = 8.4;
    text(1, y_pos, '1. BASE SYSTEM PARAMETERS', 'FontSize', 12, 'FontWeight', 'bold'); y_pos = y_pos - 0.3;
    text(1.2, y_pos, sprintf('- Longitud Base: %.2f millas', l0), 'FontSize', 11); y_pos = y_pos - 0.25;
    text(1.2, y_pos, sprintf('- Reception Voltaje: %.2f kV', Vr/1000), 'FontSize', 11); y_pos = y_pos - 0.25;
    text(1.2, y_pos, sprintf('- Load demand: %.2f MW (Power Factor: %.2f)', Load/1e6, FP), 'FontSize', 11); y_pos = y_pos - 0.6;

    % --- SECCIÓN 2: LEADWIRE SELECTION ---
    text(1, y_pos, '2. REGULATION (FASE I)', 'FontSize', 12, 'FontWeight', 'bold'); y_pos = y_pos - 0.3;
    text(1.2, y_pos, sprintf('Best Leadwire: %s', upper(cond_names{sel_mat})), 'FontSize', 11, 'FontWeight', 'bold', 'Color', '#004C99'); y_pos = y_pos - 0.25;
    text(1.2, y_pos, sprintf('Best Global Leadwire: %s', upper(cond_names{best_global_wire})), 'FontSize', 11); y_pos = y_pos - 0.6;

    % --- SECCIÓN 3: PARAMETRIC ANALYSIS TABLE ---
    text(1, y_pos, '3. PARAMETRIC DATA: LENGTH VS PERFORMANCE (PHASE III)', 'FontSize', 12, 'FontWeight', 'bold'); y_pos = y_pos - 0.3;

    % Encabezados de tabla
    text(1.2, y_pos, 'Length [mi]', 'FontWeight', 'bold', 'FontSize', 10);
    text(3.0, y_pos, 'Sending voltage [kV]', 'FontWeight', 'bold', 'FontSize', 10);
    text(4.8, y_pos, 'Sending current [A]', 'FontWeight', 'bold', 'FontSize', 10);
    text(6.6, y_pos, 'Sending Potence [MW]', 'FontWeight', 'bold', 'FontSize', 10);
    text(8.4, y_pos, 'Regulation [%]', 'FontWeight', 'bold', 'FontSize', 10);
    y_pos = y_pos - 0.1;
    plot([1.2 9.5], [y_pos y_pos], 'k-', 'LineWidth', 1);
    y_pos = y_pos - 0.25;
    
    idx_samples = round(linspace(1, nL, 8));
    for i = 1:length(idx_samples)
        idx = idx_samples(i);
        
        text(1.2, y_pos, sprintf('%.1f', Lvec(idx)), 'FontSize', 10);
        text(3.0, y_pos, sprintf('%.3f', Vl_vec(1, idx)/1000), 'FontSize', 10);
        text(4.8, y_pos, sprintf('%.2f', Is_vec(1, idx)), 'FontSize', 10);
        text(6.6, y_pos, sprintf('%.2f', P_vec(1, idx)/1e6), 'FontSize', 10);
        
        color_reg = 'k';
        if Reg_vec(1, idx) > 20 || Reg_vec(1, idx) < 15
            color_reg = [0.8 0 0]; 
        end
        text(8.4, y_pos, sprintf('%.3f', Reg_vec(1, idx)), 'FontSize', 10, 'Color', color_reg);
        
        y_pos = y_pos - 0.25;
    end
    y_pos = y_pos - 0.4;

    % --- SECTION 4: TRANSIENT ---
    if run_transient == 1
        plot([1 9], [y_pos+0.2 y_pos+0.2], 'k:', 'LineWidth', 1);
        text(1, y_pos, '4. TRANSIENT EXTREMES (PHASE IV))', 'FontSize', 12, 'FontWeight', 'bold'); y_pos = y_pos - 0.3;
        text(1.2, y_pos, sprintf('- Maximum Sending Voltage Peak: %.2f kV', max(Vs_t)/1000), 'FontSize', 11); y_pos = y_pos - 0.25;
        text(1.2, y_pos, sprintf('- Maximum Line Current Peak: %.2f A', max(IL_t)), 'FontSize', 11); y_pos = y_pos - 0.25;
        text(1.2, y_pos, sprintf('- Maximum Instantaneous Sending Power: %.2f MW', max(P_send_t)), 'FontSize', 11);
    end
    
    set(figReport, 'PaperOrientation', 'portrait');
    set(figReport, 'PaperUnits', 'normalized');
    set(figReport, 'PaperPosition', [0 0 1 1]);
    print(figReport, name_datasheet_pdf, '-dpdf', '-r300'); 
    close(figReport);

    fprintf('--> Datasheet successfully generated: %s\n', name_datasheet_pdf);
end

%% 9. PHASE VI: 3D VISUALIZATION OF LINE GEOMETRY
Span_defect = 1300; 

if show_3d == 1
    disp(' ');
    disp('==============================================================');
    disp('   PHASE 6: 3D PHYSICAL GEOMETRY (CATENARY MODEL - STATIC)');
    disp('==============================================================');
    disp('Rendering 3D Catenary geometry...');

    H_tower = 120;
    Sag = 35;
    
    x_span = linspace(0, Span_defect, 200);
    z_catenary = H_tower - Sag * (1 - (2*x_span/Span_defect - 1).^2);
    
    y_A = -Dab_0;
    y_B = 0;
    y_C = Dbc_0;

    fig3D = uifigure('Name', '3D Transmission Line Geometry', 'Color', '#F7F9FC', 'Position', [100, 100, 900, 700]);
    ax3D = uiaxes(fig3D, 'Position', [50 50 800 600]);
    hold(ax3D, 'on'); grid(ax3D, 'on'); view(ax3D, 35, 20);
    
    colorA = [0.8 0.2 0.2];
    colorB = [0.2 0.8 0.2];
    colorC = [0.2 0.2 0.8];

    plot3(ax3D, x_span, repmat(y_A, size(x_span)), z_catenary, 'Color', colorA, 'LineWidth', 2.5, 'DisplayName', 'Phase A');
    plot3(ax3D, x_span, repmat(y_B, size(x_span)), z_catenary, 'Color', colorB, 'LineWidth', 2.5, 'DisplayName', 'Phase B');
    plot3(ax3D, x_span, repmat(y_C, size(x_span)), z_catenary, 'Color', colorC, 'LineWidth', 2.5, 'DisplayName', 'Phase C');

    plot3(ax3D, [0 0], [0 0], [0 H_tower], 'k', 'LineWidth', 4, 'HandleVisibility', 'off');
    plot3(ax3D, [0 0], [y_A-5 y_C+5], [H_tower H_tower], 'k', 'LineWidth', 3, 'HandleVisibility', 'off');

    plot3(ax3D, [Span_defect Span_defect], [0 0], [0 H_tower], 'k', 'LineWidth', 4, 'HandleVisibility', 'off');
    plot3(ax3D, [Span_defect Span_defect], [y_A-5 y_C+5], [H_tower H_tower], 'k', 'LineWidth', 3, 'HandleVisibility', 'off');

    fill3(ax3D, [-100 Span_defect+100 Span_defect+100 -100], [-80 -80 80 80], [0 0 0 0], [0.2 0.4 0.2], 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Ground Level');

    xlabel(ax3D, 'Span Length (X) [ft]', 'FontWeight', 'bold');
    ylabel(ax3D, 'Phase Spacing (Y) [ft]', 'FontWeight', 'bold');
    zlabel(ax3D, 'Height from Ground (Z) [ft]', 'FontWeight', 'bold');
    title(ax3D, sprintf('3D Catenary Profile | Span: %d ft | Max Sag: %d ft', Span_defect, Sag), 'FontSize', 14, 'Color', '#1A2A3A');
    
    xlim(ax3D, [-50 Span_defect+50]);
    ylim(ax3D, [-80 80]);
    zlim(ax3D, [0 H_tower+20]);
    legend(ax3D, 'Location', 'northeast');

    disp('--> 3D Render Complete. You can rotate the figure using your mouse.');
end

%% 10. PHASE VII: PROFESSIONAL INTERACTIVE 3D SIMULATOR V6 (ELECTRICAL-MECHANICAL)
disp(' ');
disp('==============================================================');
disp('   PHASE 7: ADVANCED INTERACTIVE 3D TOWER & CATENARY SIMULATOR');
disp('==============================================================');
disp('Starting integrated Electrical-Mechanical environment...');

% HERE THE MAGIC OF FUSION HAPPENS: We pass the system voltage (in kV)
% calculated at the beginning, and the Span_defect, so that the mechanical
% model starts parameterized with the previously calculated electrical reality.
Voltage_sist_kV = Vr / 1000;
App_Transmision_3D_Switch(Voltage_sist_kV, Span_defect);

% =========================================================================

function App_Transmision_3D_Switch(v_inicial_kV, span_initial)
    % 1. Principal
    fig = uifigure('Name', 'EXPERT 3D LTDESIGN', ...
                   'Position', [100, 100, 1150, 800], 'Color', 'w');

    % 2. Eje 3D
    ax = uiaxes(fig, 'Position', [300, 70, 820, 700], 'BackgroundColor', 'w');
    hold(ax, 'on'); view(ax, -45, 15); grid(ax, 'on'); ax.GridAlpha = 0.1;

    % 3. Control
    pnl = uipanel(fig, 'Title', 'Configuration', 'Position', [20, 180, 260, 600]);
    
    % --- SWITCH ---
    uilabel(pnl, 'Text', 'SELECTION:', 'Position', [10, 540, 200, 22], 'FontWeight', 'bold');
    swMode = uiswitch(pnl, 'slider', 'Items', {'MANUAL', 'AUTO'}, 'Position', [80, 500, 60, 25], 'Value', 'AUTO');
    
    % --- AUTOMATIC MODE ---
    uilabel(pnl, 'Text', 'Operating Voltage [kV]:', 'Position', [10, 450, 200, 22]);
    editVolt = uieditfield(pnl, 'numeric', 'Position', [10, 425, 100, 25], 'Value', v_inicial_kV); 

    % --- MANUAL MODE ---
    uilabel(pnl, 'Text', 'Especific Tower (Manual):', 'Position', [10, 370, 200, 22]);
    selTorre = uidropdown(pnl, 'Position', [10, 345, 200, 30], ...
        'Items', {'(a) 60 kV', '(b) 115 kV', '(c) 250 kV', '(d) 230 kV', '(e) 380 kV Barril', '(f) 380 kV Base Ancha'}, ...
        'ItemsData', 1:6, 'Value', 4);

    % --- MECHANIC PARAMETERS ---
    uilabel(pnl, 'Text', 'Length [ft]:', 'Position', [10, 280, 200, 22]);
    editSpan = uieditfield(pnl, 'numeric', 'Position', [10, 255, 100, 25], 'Value', span_initial);

    uilabel(pnl, 'Text', 'Mechanic tension [lb]:', 'Position', [10, 210, 200, 22]);
    editTens = uieditfield(pnl, 'numeric', 'Position', [10, 185, 100, 25], 'Value', 5000);

    % RUN BUTTON
    uibutton(pnl, 'Text', 'GENERATE 3D MODEL', 'Position', [10, 100, 220, 50], ...
        'BackgroundColor', '#004C99', 'FontColor', 'w', 'FontWeight', 'bold', ...
        'ButtonPushedFcn', @(btn,event) act_logic(ax, swMode.Value, editVolt.Value, selTorre.Value, fig));

    resPnl = uipanel(fig, 'Title', 'Span Technical Data', 'Position', [800, 80, 320, 140], 'BackgroundColor', 'w');
    lblTipo = uilabel(resPnl, 'Text', 'Tower: --', 'Position', [10, 85, 300, 22], 'FontWeight', 'bold');
    lblAlt = uilabel(resPnl, 'Text', 'Minimum Height: --', 'Position', [10, 55, 300, 22]);
    lblStatus = uilabel(resPnl, 'Text', 'State condition: --', 'Position', [10, 25, 300, 22], 'FontSize', 12, 'FontWeight', 'bold');
    
    % Handles UserData
    fig.UserData = struct('lblTipo', lblTipo, 'lblAlt', lblAlt, 'lblStatus', lblStatus, ...
                          'editSpan', editSpan, 'editTens', editTens);
    act_logic(ax, swMode.Value, editVolt.Value, selTorre.Value, fig);
end

% =========================================================================
%(AUTO vs MANUAL)
% =========================================================================
function act_logic(ax, mode, v_input, id_manual, fig)
    cla(ax);
    
    % 1. Tower ID
    if strcmp(mode, 'AUTO')
        if v_input <= 69, id = 1;
        elseif v_input <= 138, id = 2;
        elseif v_input <= 230, id = 4;
        elseif v_input <= 300, id = 3;
        elseif v_input <= 400, id = 5;
        else, id = 6;
        end
    else
        id = id_manual;
    end
    
    % 2. Parameters
    span = fig.UserData.editSpan.Value;
    tens = fig.UserData.editTens.Value;
    peso = 0.75; % lb/ft
    
    [name, h_br, w_br, h_p, v_nom] = norms(id);
    
    % 3. Catenary and Safety Calculation
    min_clear = 15 + (max(0, v_input - 50) * 0.04); 
    flecha = (peso * span^2) / (8 * tens);
    height_min = (h_br(end) - 5) - flecha;
    
    % 4. Draw Scene
    for x0 = [0, span]
        draw_tower_3D(ax, x0, h_br, w_br, h_p);
    end
    
    x_vec = linspace(0, span, 200);
    cols = [0.9 0.1 0.1; 0.1 0.7 0.1; 0.1 0.3 0.9];
    for circ = [-1, 1]
        for niv = 1:3
            z_at = h_br(niv); y_at = circ * w_br(niv);
            z_c = (z_at - 5) - flecha * (1 - (2*x_vec/span - 1).^2);
            plot3(ax, x_vec, repmat(y_at, size(x_vec)), z_c, 'Color', cols(niv,:), 'LineWidth', 2.5);
        end
    end
    
    % Height measurement line
    plot3(ax, [span/2 span/2], [0 0], [0 height_min], 'k--', 'LineWidth', 1.2);
    
    % 5. Update Results
    fig.UserData.lblTipo.Text = ['Use Tower: ', name];
    fig.UserData.lblAlt.Text = sprintf('Center Height: %.2f ft (Min: %.2f)', height_min, min_clear);
    
    if height_min >= min_clear
        fig.UserData.lblStatus.Text = 'STATUS: SAFE ';
        fig.UserData.lblStatus.FontColor = [0 0.5 0];
    else
        fig.UserData.lblStatus.Text = 'STATUS: ¡DANGER!';
        fig.UserData.lblStatus.FontColor = [0.8 0 0];
    end
    
    title(ax, ['3D Mechanical-Electrical Analysis - mode ', mode], 'FontSize', 15);
    axis(ax, 'equal'); zlim(ax, [0 h_p+20]);
end

% --- TOWERS ---
function [n, hb, wb, hp, v] = norms(id)
    switch id
        case 1; n='(a) 60kV'; hb=[60,50,40]; wb=[10,10,10]; hp=72; v=60;
        case 2; n='(b) 115kV'; hb=[90,75,60]; wb=[15,15,15]; hp=105; v=115;
        case 3; n='(c) 250kV'; hb=[105,85,65]; wb=[18,18,18]; hp=120; v=250;
        case 4; n='(d) 230kV'; hb=[120,100,80]; wb=[20,20,20]; hp=135; v=230;
        case 5; n='(e) 380kV Barril'; hb=[145,120,95]; wb=[28,35,28]; hp=165; v=380;
        case 6; n='(f) 380kV Base Ancha'; hb=[150,125,100]; wb=[30,40,30]; hp=175; v=380;
    end
end

% --- ESTRUCTURAL ---
function draw_tower_3D(ax, x0, hb, wb, hp)
    plot3(ax, [x0 x0], [0 0], [0 hp], 'k', 'LineWidth', 2.5);
    for i=1:3
        plot3(ax, [x0 x0], [-wb(i) wb(i)], [hb(i) hb(i)], 'k', 'LineWidth', 2.5);
    end
    % DATA BASE
    plot3(ax, [x0 x0], [-10 0], [0 25], 'k', 'LineWidth', 1.5);
    plot3(ax, [x0 x0], [10 0], [0 25], 'k', 'LineWidth', 1.5);
end