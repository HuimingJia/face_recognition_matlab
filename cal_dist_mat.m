function dist_mat = cal_dist_mat(G_mat, P_mat, order)
% 计算特征向量之间的距离
% order = 1: 1-范数
% order = 2: 2-范数  
% order = 3: 卡方距离 Chi-squre distance
	g_num = size(G_mat, 2); %列数，即样本数
	p_num = size(P_mat, 2); %列数，即样本数
	dist_mat = zeros(g_num, p_num);

	for pid = 1: p_num
		p_face_vector = P_mat(:, pid);
	
		for gid = 1:g_num
			g_face_vector = G_mat(:, gid);
			
			diff_vector = p_face_vector - g_face_vector;
			if(order == 1)
				dist_mat(gid, pid) = sum( sum ( abs ( diff_vector ) ) );
			elseif( order == 2 )
				dist_mat(gid, pid) = diff_vector' * diff_vector;
			elseif( order == 3 ) %chi-squre distance
				ss = p_face_vector + g_face_vector;
				ss(ss==0) = 1; %将0元素置为1，防止下一步中0作为分母
				dist_mat(gid, pid) = sum(diff_vector .* diff_vector ./ ss);
			end
		end
	end
end
