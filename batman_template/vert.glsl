varying vec3 N_frag,V_frag,dPds_frag,dPdt_frag;
varying vec2 st_frag;
float selfDot(vec3 v){
	return v.x * v.x + v.y * v.y + v.z * v.z;
}
void main(){
	vec3 Ps=P*scales;
	gl_Position=mat_proj*mat_view*vec4(Ps,1.0);
	V_frag=normalize((mat_view*vec4(Ps,1.0)).xyz);
	N_frag=normalize((mat_view*vec4(N.x,N.y,-N.z,0.0)).xyz);
	if (selfDot(dPds) > 0.0){
		dPds_frag=normalize((mat_view*vec4(dPds.x,dPds.y,-dPds.z,0.0)).xyz);	
	}else{
		dPds_frag=vec3(0.0);
	}
	if (selfDot(dPdt) > 0.0){
		dPdt_frag=normalize((mat_view*vec4(dPdt.x,dPdt.y,-dPdt.z,0.0)).xyz);
	}else{
		dPdt_frag=vec3(0.0);
	}
	st_frag=st;
}
