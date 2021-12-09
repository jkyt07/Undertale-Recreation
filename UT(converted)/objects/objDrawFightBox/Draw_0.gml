//if !yourTurn
{
	draw_rectangle_color(0, 899, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, 0)
	draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), 566, c_black, c_black, c_black, c_black, 0)
	draw_rectangle_color(midCam - 380, 530, midCam - 247, 920, c_black, c_black, c_black, c_black, 0)
	draw_rectangle_color(midCam + 252, 530, midCam + 350, 920, c_black, c_black, c_black, c_black, 0)
	
	
	draw_rectangle_color(midCam - 248, 567, midCam + 251, 577, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(midCam - 248, 567, midCam - 238, 898, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(midCam + 241, 567, midCam + 251, 898, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(midCam - 248, 888, midCam + 251, 898, c_white, c_white, c_white, c_white, 0)
}