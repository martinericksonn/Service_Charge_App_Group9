package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import service.charge.group9.alliance.ServiceChargeAppGroup9.common.models.ApiResponse;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.Roles;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.messages.Messages;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service.IUserRoleService;

import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IUserRoleService serv;


    @RequestMapping("/all")
    public ApiResponse retrieveAllRole(){
        List<Roles> roleList = serv.getAllRole();
        return ApiResponse.CreateSuccess(roleList, Messages.ROLE_SUCCESSFULLY_RETRIEVE);
    }


    @GetMapping("/{id}")
    public ApiResponse getById(@PathVariable int id) {
        try{
            Roles role = serv.getRoleByID(id);
            return ApiResponse.CreateSuccess(role,Messages.ROLE_FOUND);
        }catch (Exception e){
            return ApiResponse.CreateError(Messages.USER_ROLE_NOT_FOUND
            );
    }


    }

    @GetMapping("/findRoleIdByRole/{role}")
    public ApiResponse findRoleIdByRole(@PathVariable String role) {
        try{
            Roles roleID = serv.findRoleIdByRole(role);
            return ApiResponse.CreateSuccess(roleID,Messages.ROLE_FOUND);
        }catch (Exception e){
            return ApiResponse.CreateError(Messages.USER_ROLE_NOT_FOUND
            );
        }


    }
}
