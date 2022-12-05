package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import service.charge.group9.alliance.ServiceChargeAppGroup9.common.models.ApiResponse;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.messages.Messages;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service.IUserRoleService;
import java.util.List;

@RestController
@RequestMapping("/user-role")
public class UserRoleController {

    @Autowired
    private IUserRoleService serv;

    @PostMapping("/create")
    @ResponseBody
    public ApiResponse save(UserRole userRole){
        UserRole savedUserRole = serv.saveUserRole(userRole);
        if (savedUserRole != null){
            return ApiResponse.CreateSuccess(savedUserRole, Messages.USER_ROLE_SUCCESSFULLY_SAVED);
        }
        return null;
    }

    @RequestMapping("/all")
    public ApiResponse retrieveAllUserRole(){
        List<UserRole> userRoleList = serv.getAllUserRole();
        return ApiResponse.CreateSuccess(userRoleList,Messages.USER_ROLE_SUCCESSFULLY_RETRIEVE);
    }

    

}
