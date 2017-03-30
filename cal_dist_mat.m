function dist_mat = cal_dist_mat(G_mat, P_mat, order)
% ������������֮��ľ���
% order = 1: 1-����
% order = 2: 2-����  
% order = 3: �������� Chi-squre distance
	g_num = size(G_mat, 2); %��������������
	p_num = size(P_mat, 2); %��������������
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
				ss(ss==0) = 1; %��0Ԫ����Ϊ1����ֹ��һ����0��Ϊ��ĸ
				dist_mat(gid, pid) = sum(diff_vector .* diff_vector ./ ss);
			end
		end
	end
end
