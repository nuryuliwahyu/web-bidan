<?php 
 
class m_diagnosa extends CI_Model{
    
    function tampil_data(){
        return $this->db->get('diagnosa');

    }
    
    function tambah_data() {

        $data = array(
            'id_pendaftaran' => $this->input->post('id_pendaftaran'),
            'diangosa' => $this->input->post('diagnosa')
            );
        $this->db->insert('diagnosa', $data);
        redirect('../diagnosa');
    }
  
    function ubah_data ($id_diagnosa) {
 
        $data = array(
            'diagnosa' => $this->input->post('diagnosa')
            );

        $this->db->where(array('id_diagnosa' => $id_diagnosa ));
        $this->db->update('diagnosa', $data);
        redirect('../diagnosa');
    }
    
    function hapus_data ($id_diagnosa) {
        $this->db->where(array('id_diagnosa' => $id_diagnosa));
        $this->db->delete('diagnosa');
        redirect('../diagnosa');
    }

}