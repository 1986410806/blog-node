import { responseClient } from "../util/util";
import qiniu from "qiniu"

exports.getQiniuToken = (req, res) => {
    const accessKey = 'bMAjLTI9W52tgx4o-cYX6h-kgEbnOLjcvmuvAsZJ';
    const secretKey = 'sYGGxMVJTv4nz0m7YbCcfHBHeq6c1Vmz4n9UE9HW';

    var mac = new qiniu.auth.digest.Mac(accessKey, secretKey);

    var options = {
        scope: "zhao-blog",
    };
    var putPolicy = new qiniu.rs.PutPolicy(options);
    var uploadToken = putPolicy.uploadToken(mac);

    responseClient(res, 200, 0, 'success', uploadToken);
}