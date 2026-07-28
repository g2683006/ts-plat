package AS.Demo.service;

import AS.Demo.dao.Sub_TeaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author
 * @comm
 */
@Service
public class SubTeaService {
    @Autowired
    private Sub_TeaMapper sub_teaMapper;

}
